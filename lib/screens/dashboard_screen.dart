import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../services/permission_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String permissionStatus = 'No permissions requested';
  String ipAddress = '';

  Future<void> requestPermissions() async {
    final cameraGranted =
    await PermissionService.requestCameraPermission();

    final storageGranted =
    await PermissionService.requestStoragePermission();

    setState(() {
      if (cameraGranted && storageGranted) {
        permissionStatus = 'Camera & Storage Granted ✅';
      } else {
        permissionStatus = 'Permission Denied ❌';
      }
    });
  }

  /// INTERNET PERMISSION DEMO
  Future<void> fetchPublicIP() async {
    final response = await http
        .get(Uri.parse('https://api.ipify.org?format=json'));

    final data = jsonDecode(response.body);
    setState(() => ipAddress = data['ip']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CyberLog Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.security, size: 80),
            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Request Permissions'),
                subtitle: Text(permissionStatus),
                trailing: ElevatedButton(
                  onPressed: requestPermissions,
                  child: const Text('Enable'),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.public),
                title: const Text('Internet Permission'),
                subtitle: Text(
                  ipAddress.isEmpty
                      ? 'Fetch Public IP'
                      : 'IP: $ipAddress',
                ),
                trailing: ElevatedButton(
                  onPressed: fetchPublicIP,
                  child: const Text('Fetch'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
