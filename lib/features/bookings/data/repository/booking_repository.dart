import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/booking_model.dart';

class BookingsRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBooking(BookingModel booking) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('bookings')
          .add(booking.toMap());
    }
  }

  Future<List<BookingModel>> getBookings() async {
    final user = _auth.currentUser;
    if (user != null) {
      final snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('bookings')
          .get();

      return snapshot.docs
          .map((doc) => BookingModel.fromMap(doc.data()))
          .toList();
    }
    return [];
  }
}