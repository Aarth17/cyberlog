import 'package:flutter/material.dart';
import 'log.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Log> logs = [
      Log(action: "User Login", timestamp: DateTime.now(), status: "Success"),
      Log(action: "Password Changed", timestamp: DateTime.now(), status: "Success"),
      Log(action: "Failed Login Attempt", timestamp: DateTime.now(), status: "Failed"),
      Log(action: "Profile Updated", timestamp: DateTime.now(), status: "Success"),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CyberLog - Logs"),
        ),
        body: ListView(
          children: logs.map((log) {
            return ListTile(
              title: Text(log.action),
              subtitle: Text(
                "${log.timestamp.toLocal()}",
              ),
              trailing: Text(log.status),
            );
          }).toList(),
        ),
      ),
    );
  }
}
