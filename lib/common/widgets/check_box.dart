import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_text.dart';


class JobTypeCheckBox extends StatefulWidget {
  const JobTypeCheckBox({super.key, required this.text});
  final String text;

  @override
  State<JobTypeCheckBox> createState() => _JobTypeCheckBoxState();
}

class _JobTypeCheckBoxState extends State<JobTypeCheckBox> {
  var checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          side: BorderSide(width: 1, color: R.theme.color300),
          value: checkbox,
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return R.theme.green;
            } else {
              return Colors.transparent;
            }
          }),
          onChanged: (val) {
            setState(() {
              checkbox = !checkbox;
            });
          },
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        ),
        4.sbw,
        MyText(
          text: widget.text,
          fontSize: 14,
          color: R.theme.color500,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}