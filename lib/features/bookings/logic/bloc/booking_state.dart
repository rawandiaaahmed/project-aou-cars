

import 'package:flutter_application_1/features/bookings/data/models/booking_model.dart';

abstract class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingAdded extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<BookingModel> bookings;
  BookingsLoaded(this.bookings);
}

class BookingsError extends BookingsState {
  final String message;
  BookingsError(this.message);
}