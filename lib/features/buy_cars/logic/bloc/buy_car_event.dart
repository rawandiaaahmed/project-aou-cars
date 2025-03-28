// buy_cars_event.dart
abstract class BuyCarsEvent {}

class LoadBuyCars extends BuyCarsEvent {}

class SelectCarEvent extends BuyCarsEvent {
  final Map<String, dynamic> selectedCar;

  SelectCarEvent(this.selectedCar);
}