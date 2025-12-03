import 'package:flutter/material.dart';

class AgeVerificationScreen extends StatefulWidget {
  const AgeVerificationScreen({super.key});

  @override
  State<AgeVerificationScreen> createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  DateTime? _selectedDate;
  final int _minimumAge = 16;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 16)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _verifyAge() {
    if (_selectedDate == null) return;

    final now = DateTime.now();
    final age = now.year - _selectedDate!.year - 
        ((now.month < _selectedDate!.month || 
        (now.month == _selectedDate!.month && now.day < _selectedDate!.day)) ? 1 : 0);

    if (age >= _minimumAge) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Access Denied'),
          content: const Text('You must be at least 16 years old to join Linelink.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.verified_user_outlined, size: 80, color: Color(0xFF00C300)),
              const SizedBox(height: 24),
              const Text(
                'Welcome to Linelink',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'To ensure a safe community, we need to verify your age. You must be 16+ to join.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              OutlinedButton(
                onPressed: _presentDatePicker,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFF00C300)),
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Select Date of Birth'
                      : 'DOB: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: const TextStyle(fontSize: 18, color: Color(0xFF00C300)),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _selectedDate == null ? null : _verifyAge,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF00C300),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Continue', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
