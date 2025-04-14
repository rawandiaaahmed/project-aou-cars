import 'package:flutter_application_1/features/bookings/data/repository/booking_repository.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_event.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final BookingsRepository bookingsRepository;

  BookingsBloc({required this.bookingsRepository}) : super(BookingsInitial()) {
    on<AddBookingEvent>((event, emit) async {
      emit(BookingsLoading());
      try {
        await bookingsRepository.addBooking(event.booking);
        emit(BookingAdded());
        add(LoadBookingsEvent()); // Load after adding
      } catch (e) {
        emit(BookingsError(e.toString()));
      }
    });

    on<LoadBookingsEvent>((event, emit) async {
      emit(BookingsLoading());
      try {
        final bookings = await bookingsRepository.getBookings();
        emit(BookingsLoaded(bookings));
      } catch (e) {
        emit(BookingsError(e.toString()));
      }
    });
  }
}