import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/core/core.dart';
import '../../app/core/localization/locales.g.dart';
import 'my_text.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({super.key});

  @override
  _ResendCodeWidgetState createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  int _seconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the countdown when the widget is initialized
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Function to start the timer and update the countdown
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--; // Decrement seconds every second
        } else {
          _timer?.cancel(); // Stop the timer at 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(
        text: _seconds > 0
            ? LocaleKeys.resend_code_timer.tr
            : LocaleKeys.resend_code.tr,
        fontSize: 16,
        color: R.theme.green,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}