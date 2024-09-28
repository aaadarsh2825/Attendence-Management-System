// lib/services/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add attendance record
  Future<void> addAttendanceRecord() async {
    final user = _auth.currentUser;
    if (user != null) {
      final now = DateTime.now();
      try {
        await _db.collection('attendance').add({
          'userId': user.uid,
          'timestamp': now,
        });
        print('Attendance record added for user: ${user.uid}');
      } catch (e) {
        print('Failed to add attendance record: $e');
      }
    } else {
      print('No user is logged in.');
    }
  }

  // Get attendance records for the current user
  Stream<QuerySnapshot> getAttendanceRecords() {
    final user = _auth.currentUser;
    if (user == null) {
      print('User is not logged in');
      return Stream.empty(); // Return an empty stream if the user is not logged in
    }

    print('Fetching records for user: ${user.uid}');
    return _db
        .collection('attendance')
        .where('userId', isEqualTo: user.uid)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .handleError((error) {
      print('Error fetching records: $error');
    });
  }
}
