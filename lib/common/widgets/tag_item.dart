import 'package:flutter/material.dart';

import '../../app/core/core.dart';
import 'my_text.dart';

class TagItem extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const TagItem({super.key, required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: R.theme.green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            text: label,
            fontSize: 12,
            color: R.theme.green,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close_rounded, size: 20, color: R.theme.red),
          ),
        ],
      ),
    );
  }
}
