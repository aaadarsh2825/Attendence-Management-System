import 'package:attendance_management_system/screens/dashboard_screen.dart';
import 'package:attendance_management_system/screens/login_screen.dart';
import 'package:attendance_management_system/screens/mark_attendance_screen.dart';
import 'package:attendance_management_system/screens/attendance_history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: AuthCheck(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/login': (context) => LoginScreen(),
        '/mark_attendance': (context) => MarkAttendanceScreen(),
        '/attendance_history': (context) => AttendanceHistoryScreen(),
      },
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return DashboardScreen();
        }
        return LoginScreen();
      },
    );
  }
}
