from flask import Flask, request, jsonify # type: ignore
import pandas as pd
import re
import numpy as np
from sklearn.neighbors import NearestNeighbors # type: ignore
from sklearn.preprocessing import StandardScaler, OneHotEncoder # type: ignore
from sklearn.compose import ColumnTransformer # type: ignore
from sklearn.impute import SimpleImputer # type: ignore
from sklearn.pipeline import Pipeline # type: ignore
import joblib # type: ignore
from fuzzywuzzy import process # type: ignore
import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
cred = credentials.Certificate("C:/Users/ALANDALUS/Downloads/project-aou-cars-firebase-adminsdk-fbsvc-5d6ceda470.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

app = Flask(__name__)

def clean_price(price):
    """Convert price strings to numeric values"""
    if pd.isna(price) or str(price).strip() == '':
        return np.nan
    try:
        return float(re.sub(r'[^\d.]', '', str(price)))
    except ValueError:
        return np.nan

def find_closest_city(user_input, city_list):
    """Find the closest matching city name using fuzzy matching"""
    try:
        matches = process.extractBests(user_input, city_list, limit=3, score_cutoff=60)
        return [match[0] for match in matches] if matches else []
    except Exception:
        return []

def clean_city_name(city, all_cities):
    """Standardize city names with fuzzy matching fallback"""
    if pd.isna(city) or str(city).strip() == '':
        return 'Unknown'

    original = str(city).strip().title()
    standardized = original

    city_mappings = {
        'tagamo3': 'Tagamo3 - New Cairo',
        'kafr eldawwar': 'Kafr El-Dawwar',
        'nasr': 'Nasr City',
        'elharam': 'El Haram',
        'fayoum': 'Faiyum',
        'alex': 'Alexandria'
    }

    lower_input = original.lower()
    for pattern, replacement in city_mappings.items():
        if pattern in lower_input:
            standardized = replacement
            break

    if standardized not in all_cities:
        matches = find_closest_city(original, all_cities)
        if matches:
            standardized = matches[0]
        else:
            standardized = 'Unknown'

    return standardized if standardized in all_cities else original

def clean_data(df):
    """Perform comprehensive data cleaning"""
    df = df.copy()
    df['Price'] = df['Price'].apply(clean_price)

    bool_cols = ['Automatic Transmission', 'Air Conditioner', 'Power Steering']
    for col in bool_cols:
        if col in df.columns:
            df[col] = (df[col].astype(str).str.strip().str.lower()
                       .map({'yes': 1, '1': 1, 'true': 1, 'no': 0, '0': 0, 'false': 0})
                       .fillna(0).astype(int))

    all_cities = list(df['City'].astype(str).str.strip().str.title().unique())

    if 'City' in df.columns:
        df['City'] = df['City'].apply(lambda x: clean_city_name(x, all_cities))

    for col in ['Make', 'Model']:
        if col in df.columns:
            df[col] = (df[col].astype(str)
                       .str.strip()
                       .replace('', 'Unknown')
                       .replace('nan', 'Unknown'))

    df = df.dropna(subset=['Price', 'Make', 'Model'])
    return df.reset_index(drop=True)

def get_preprocessor():
    """Create preprocessing pipeline"""
    numeric_transformer = Pipeline(steps=[
        ('imputer', SimpleImputer(strategy='median')),
        ('scaler', StandardScaler())
    ])

    categorical_transformer = Pipeline(steps=[
        ('imputer', SimpleImputer(strategy='constant', fill_value='Unknown')),
        ('onehot', OneHotEncoder(handle_unknown='ignore'))
    ])

    return ColumnTransformer(
        transformers=[
            ('num', numeric_transformer, ['Price']),
            ('cat', categorical_transformer, ['City', 'Make', 'Model'])
        ],
        remainder='drop'
    )

def recommend_cars(budget, location, num_recommendations=5):
    """Generate car recommendations"""
    try:
        budget = float(re.sub(r'[^\d.]', '', str(budget)))
        query_data = {
            'Price': [budget],
            'City': [location],
            'Make': ['any'],
            'Model': ['any']
        }

        for col in ['Automatic Transmission', 'Air Conditioner', 'Power Steering']:
            if col in df.columns:
                query_data[col] = [1]

        query_df = pd.DataFrame(query_data)
        query_processed = preprocessor.transform(query_df)
        distances, indices = model.kneighbors(query_processed, n_neighbors=num_recommendations)

        recommendations = df.iloc[indices[0]]
        display_df = recommendations[['Make', 'Model', 'Price', 'City']].copy()
        display_df['Price'] = display_df['Price'].apply(lambda x: f"{x:,.0f} EGP")
        return display_df

    except Exception as e:
        return jsonify({'error': f'Could not generate recommendations: {str(e)}'}), 500

# Load trained model
df, preprocessor, model = joblib.load('car_model.joblib')

@app.route('/')
def home():
    return jsonify({'status': 'Car recommendation API is running!'})

@app.route('/recommend', methods=['POST'])
def recommend():
    data = request.get_json()
    budget = data.get('budget')
    location = data.get('location')

    if not budget or not location:
        return jsonify({'error': 'Missing budget or location'}), 400

    recs = recommend_cars(budget, location)
    return jsonify(recs.to_dict(orient='records'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)