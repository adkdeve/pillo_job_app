import 'package:flutter/material.dart';
import '../../app/core/core.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(10, 99, 117, 0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: R.theme.green,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   side: BorderSide.none,
        // ),
      ),
    );
  }
}
