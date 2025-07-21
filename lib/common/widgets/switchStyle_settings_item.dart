import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_text.dart';

class SwitchSettingItem extends StatelessWidget {
  final String title;
  final String description;
  final RxBool switchValue;
  final ValueChanged<bool> onChanged;

  const SwitchSettingItem({
    super.key,
    required this.title,
    required this.description,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title.tr,
                fontSize: 14,
                // color: R.theme.color900,
                fontWeight: FontWeight.w500,
              ),
              4.sbh,
              MyText(
                text: description.tr,
                fontSize: 12,
                textAlign: TextAlign.left,
                opacity: 0.5,
                // color: R.theme.color500,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          child: Switch(
            value: switchValue.value,
            onChanged: onChanged,
            activeTrackColor: R.theme.green,
            activeColor: R.theme.white,
            inactiveThumbColor: R.theme.green,
            inactiveTrackColor: R.theme.white,
          ),
        ),
      ],
    );
  }
}
