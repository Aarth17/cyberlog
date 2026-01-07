import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const platform = MethodChannel('device/info');

  String deviceModel = 'Loading...';
  String androidVersion = 'Loading...';

  Future<void> loadDeviceInfo() async {
    try {
      final result = await platform.invokeMethod('getDeviceInfo');
      setState(() {
        deviceModel = result['model'];
        androidVersion = result['androidVersion'];
      });
    } catch (e) {
      setState(() {
        deviceModel = 'Error';
        androidVersion = 'Error';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Device Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('Device Model'),
              subtitle: Text(deviceModel),
            ),
            ListTile(
              title: const Text('Android Version'),
              subtitle: Text(androidVersion),
            ),
          ],
        ),
      ),
    );
  }
}
