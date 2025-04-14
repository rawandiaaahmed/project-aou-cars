

import 'package:flutter_application_1/features/bookings/data/models/booking_model.dart';

abstract class BookingsEvent {}

class AddBookingEvent extends BookingsEvent {
  final BookingModel booking;
  AddBookingEvent(this.booking);
}

class LoadBookingsEvent extends BookingsEvent {}