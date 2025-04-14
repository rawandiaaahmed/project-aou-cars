class BookingModel {
  final String carName;
  final String date;
  final String status;
  final String iconpath;
  final String suptitle;
   final String prise;
    final String City;
     final String Model;
      final String make;
       final String Color;


  BookingModel(
      {required this.carName,
      required this.date,
      required this.status,
      required this.iconpath,
      required this.suptitle,
      required this.prise,
      required this.City,
      required this.Model,
      required this.make,
      required this.Color});

     

  Map<String, dynamic> toMap() {
    return {
      'carName': carName,
      'date': date,
      'status': status,
      'iconpath': iconpath,
      'suptitle': suptitle,
      'prise': prise,
      'City': City,
      'Model': Model,
      'make': make,
      'Color': Color,

    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      carName: map['carName'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      iconpath: map['iconpath'] ?? '',
      suptitle: map['suptitle'] ?? '',
      prise: map['prise'] ?? '',
      City: map['City'] ?? '',
      Model: map['Model'] ?? '',
      make: map['make'] ?? '',
      Color: map['Color'] ?? '',
      
    );
  }
}
