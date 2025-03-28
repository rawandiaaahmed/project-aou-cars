// buy_cars_bloc.dart
import 'package:flutter_application_1/features/buy_cars/logic/bloc/buy_car_event.dart';
import 'package:flutter_application_1/features/buy_cars/logic/bloc/buy_car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BuyCarsBloc extends Bloc<BuyCarsEvent, BuyCarsState> {
  BuyCarsBloc() : super(BuyCarsInitial()) {
    on<LoadBuyCars>((event, emit) {
      emit(BuyCarsLoading());


      final cars = [
        {
          'iconpath': 'assets/images/car2.jpeg',
          'title': 'Toyota Corolla 2021',
          'suptitle': 'Automatic • 88,500 Km',
          'prise': '1,700,000 EGP',
          'Color': 'Brown',
          'City': 'Giza',
          'Model': 'Sportage',
          'make': 'Kia',
        },
        {
          'iconpath': 'assets/images/cars.jpeg',
          'title': 'Nissan Sunny 2022',
          'suptitle': 'Automatic • 89,500 Km',
          'prise': '1,600,000 EGP',
          'Color': 'Brown',
          'City': 'Giza',
          'Model': 'Sportage',
          'make': 'Kia',
        },
        {
          'iconpath': 'assets/images/carrs.jpeg',
          'title': 'Kia Spectra 2002',
          'suptitle': 'Automatic • 82,500 Km',
          'prise': '1,500,000 EGP',
          'Color': 'Black',
          'City': 'Alexandria',
          'Model': 'Sportage',
          'make': 'Kia',
        },
        {
          'iconpath': 'assets/images/carrrs.avif',
          'title': 'BMW X1 2018',
          'suptitle': 'Automatic • 89,500 Km',
          'prise': '2,500,000 EGP',
          'Color': 'Silver',
          'City': 'Giza',
          'Model': 'Sportage',
          'make': 'Kia',
        },
        {
          'iconpath': 'assets/images/ccaarrss.jpeg',
          'title': 'BMW X1 2018',
          'suptitle': 'Automatic • 89,500 Km',
          'prise': '3,500,000 EGP',
          'Color': 'Red',
          'City': 'Alexandria',
          'Model': 'Sportage',
          'make': 'Kia',
        },
      ];

      emit(BuyCarsLoaded(cars));
    });

    on<SelectCarEvent>((event, emit) {
      emit(BuyCarsDetailsState(event.selectedCar));
    });
  }
}