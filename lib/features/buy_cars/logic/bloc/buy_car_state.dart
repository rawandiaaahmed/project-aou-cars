// buy_cars_state.dart
abstract class BuyCarsState {}

class BuyCarsInitial extends BuyCarsState {}

class BuyCarsLoading extends BuyCarsState {}

class BuyCarsLoaded extends BuyCarsState {
  final List<Map<String, dynamic>> cars;

  BuyCarsLoaded(this.cars);
}

class BuyCarsDetailsState extends BuyCarsState {
  final Map<String, dynamic> selectedCar;

  BuyCarsDetailsState(this.selectedCar);
}