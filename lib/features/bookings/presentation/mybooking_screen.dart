import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';
import 'package:flutter_application_1/features/bookings/data/repository/booking_repository.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_bloc.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_event.dart';
import 'package:flutter_application_1/features/bookings/logic/bloc/booking_state.dart';
import 'package:flutter_application_1/features/bookings/presentation/widgets/booking_items.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingsBloc(bookingsRepository: BookingsRepository())..add(LoadBookingsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Bookings',style: TextStyle(color: ColorsManager.mainBlue),),
          centerTitle: true,
        ),
        body: BlocBuilder<BookingsBloc, BookingsState>(
          builder: (context, state) {
            if (state is BookingsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingsLoaded) {
              if (state.bookings.isEmpty) {
                return const Center(child: Text('No bookings yet.'));
              }
              return ListView.builder(
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final booking = state.bookings[index];
                  return BookingItem(booking: booking);
                },
              );
            } else if (state is BookingsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}