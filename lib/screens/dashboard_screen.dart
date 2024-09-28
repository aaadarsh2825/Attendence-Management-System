import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the Mark Attendance screen using named route
                Navigator.pushNamed(context, '/mark_attendance');
              },
              child: Text('Go to Mark Attendance'),
            ),
            SizedBox(height: 20), // Add some spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to the Attendance History screen using named route
                Navigator.pushNamed(context, '/attendance_history');
              },
              child: Text('View Attendance History'),
            ),
          ],
        ),
      ),
    );
  }
}
