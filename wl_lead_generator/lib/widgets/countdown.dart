import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  CountDownState createState() => CountDownState();
}

class CountDownState extends State<CountDown> {
  DateTime? targetDateTime; // The fetched target date and time
  Timer? timer; // Timer to update the countdown every second

  @override
  void initState() {
    super.initState();
    fetchTargetDateTime();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> fetchTargetDateTime() async {
    // Make an HTTP GET request to fetch the target date and time
    final response = await http.get(Uri.parse(
        'https://us-central1-continual-mind-388823.cloudfunctions.net/get-date'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final serverDateTime = DateTime.parse(jsonResponse['date']);
      targetDateTime = serverDateTime.toUtc();

      // Start the timer to update the countdown every second
      startTimer();
    } else {
      throw Exception('Failed to fetch target date and time');
    }
  }

  void startTimer() {
    // Cancel the previous timer if it exists
    timer?.cancel();

    // Start a new timer to update the countdown every second
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  String getRemainingTime() {
    final now = DateTime.now().toUtc();
    final difference = targetDateTime?.difference(now);
    if (difference == null) return '';

    if (difference.isNegative) {
      timer?.cancel();
      return 'Countdown Ended';
    }

    final days = difference.inDays;
    final hours =
        difference.inHours % 24; // Remaining hours after subtracting days
    final minutes = difference.inMinutes.remainder(60);
    final seconds = difference.inSeconds.remainder(60);

    String timeText = '';

    if (days > 0) {
      timeText += 'Days: $days | ';
    }

    timeText += 'Hours: ${hours.toString()} | ';
    timeText += 'Minutes: ${minutes.toString()} | ';
    timeText += 'Seconds: ${seconds.toString()}';

    return timeText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Countdown:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          getRemainingTime(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
