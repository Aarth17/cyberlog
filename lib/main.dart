import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String cyberTip = "Loading cyber tip...";

  @override
  void initState() {
    super.initState();
    fetchCyberTip();
  }

  Future<void> fetchCyberTip() async {
    final url =
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        cyberTip = data['title'];
      });
    } else {
      setState(() {
        cyberTip = "Failed to load cyber tip";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberLog Dashboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cyber Tip of the Day",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                cyberTip,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: fetchCyberTip,
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh Tip"),
            ),
          ],
        ),
      ),
    );
  }
}
