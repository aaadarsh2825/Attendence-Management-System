import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendance_management_system/services/firestore_service.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AttendanceHistoryScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  Future<void> exportToCSV(List<QueryDocumentSnapshot> records) async {
    List<List<String>> rows = [
      ['Date', 'Time']
    ];

    for (var doc in records) {
      final timestamp = (doc['timestamp'] as Timestamp).toDate();
      final formattedDate = "${timestamp.day}/${timestamp.month}/${timestamp.year}";
      final formattedTime = "${timestamp.hour}:${timestamp.minute}";
      rows.add([formattedDate, formattedTime]);
    }

    String csvData = const ListToCsvConverter().convert(rows);

    if (await Permission.storage.request().isGranted) {
      final directory = await getExternalStorageDirectory();
      final file = File('${directory!.path}/attendance_history.csv');

      await file.writeAsString(csvData);
      print('CSV exported to: ${file.path}');
    } else {
      print('Storage permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance History')),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getAttendanceRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No attendance records found.'));
          }

          final records = snapshot.data!.docs;
          print('Retrieved records: ${records.length}'); // Debugging log

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    final timestamp = (record['timestamp'] as Timestamp).toDate();
                    final formattedDate = "${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute}";

                    return ListTile(
                      title: Text('Date: $formattedDate'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => exportToCSV(records),
                child: Text('Export to CSV'),
              ),
            ],
          );
        },
      ),
    );
  }
}
