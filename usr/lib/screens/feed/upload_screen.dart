import 'package:flutter/material.dart';
import 'dart:math';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool _isScanning = false;
  String? _scanResult;
  bool _isClean = false;

  void _startUploadAndScan() async {
    setState(() {
      _isScanning = true;
      _scanResult = null;
    });

    // Simulate AI & Content Moderation Scan
    // In a real app, this would upload the video to a server which runs
    // Google Cloud Video Intelligence or AWS Rekognition
    await Future.delayed(const Duration(seconds: 3));

    // Randomly simulate detection for demonstration purposes
    // 70% chance of success, 30% chance of detection
    final random = Random();
    final isAiDetected = random.nextDouble() < 0.15; // 15% chance
    final isNsfwDetected = random.nextDouble() < 0.15; // 15% chance

    setState(() {
      _isScanning = false;
      if (isAiDetected) {
        _scanResult = "⚠️ Upload Blocked: AI-Generated Content Detected.\nLinelink does not allow AI videos.";
        _isClean = false;
      } else if (isNsfwDetected) {
        _scanResult = "⚠️ Upload Blocked: Inappropriate Content Detected.\nSexual content is strictly prohibited.";
        _isClean = false;
      } else {
        _scanResult = "✅ Content Verified: Safe to Post";
        _isClean = true;
      }
    });
  }

  void _postVideo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Video Posted Successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.video_call, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Select Video (Max 20s)'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Content Safety Check',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'All videos are scanned for AI-generated and sexual content before posting.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            if (_isScanning)
              Column(
                children: const [
                  LinearProgressIndicator(color: Color(0xFF00C300)),
                  SizedBox(height: 12),
                  Text('Scanning video frames for AI & NSFW content...'),
                ],
              ),
            if (_scanResult != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isClean ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isClean ? Colors.green : Colors.red,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _isClean ? Icons.check_circle : Icons.error,
                      color: _isClean ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _scanResult!,
                        style: TextStyle(
                          color: _isClean ? Colors.green[900] : Colors.red[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            if (_scanResult == null)
              FilledButton.icon(
                onPressed: _startUploadAndScan,
                icon: const Icon(Icons.search),
                label: const Text('Scan & Upload'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            if (_isClean)
              FilledButton(
                onPressed: _postVideo,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF00C300),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Post Video'),
              ),
          ],
        ),
      ),
    );
  }
}
