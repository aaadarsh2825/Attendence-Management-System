import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MarkAttendanceScreen extends StatelessWidget {
  // Function to mark attendance
  Future<void> _markAttendance(BuildContext context) async {
    try {
      // Get the current user
      final user = FirebaseAuth.instance.currentUser;

      // Ensure the user is logged in
      if (user != null) {
        // Get the current date (without time)
        final today = DateTime.now();
        final startOfDay = DateTime(today.year, today.month, today.day);

        // Check if the attendance for today has already been marked
        final querySnapshot = await FirebaseFirestore.instance
            .collection('attendance')
            .where('userId', isEqualTo: user.uid)
            .where('timestamp', isGreaterThanOrEqualTo: startOfDay)
            .get();

        if (querySnapshot.docs.isEmpty) {
          // Add an attendance record to Firestore
          await FirebaseFirestore.instance.collection('attendance').add({
            'userId': user.uid,
            'timestamp': today,
          });

          // Show a confirmation message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Attendance marked for today!')),
          );
        } else {
          // Show a message indicating attendance is already marked
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Attendance already marked for today!')),
          );
        }
      } else {
        // Show a message if the user is not logged in
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must be logged in to mark attendance.')),
        );
      }
    } catch (e) {
      // Handle any errors
      print('Error marking attendance: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error marking attendance: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mark Attendance')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _markAttendance(context),
          child: Text('Mark Attendance'),
        ),
      ),
    );
  }
}
