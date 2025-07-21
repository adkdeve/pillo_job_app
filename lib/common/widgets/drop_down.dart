import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_text.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool isDropdownOpen = false; // Track dropdown state
  String selectedLabel = 'Sales & Marketing'; // Default selected item

  final RxList<Map<String, dynamic>> items = [
    {'label': 'Creative & Design', 'value': true},
    {'label': 'Computer & Technology', 'value': false},
    {'label': 'Sales & Marketing', 'value': false},
    {'label': 'Compliance & Finance', 'value': false},
    {'label': 'Health Care', 'value': false},
    {'label': 'Tourism & Hospitality', 'value': false},
    {'label': 'Education', 'value': false},
    {'label': 'Transportation', 'value': false},
    {'label': 'Support & Management', 'value': false},
    {'label': 'Human Resources', 'value': false},
    {'label': 'Government', 'value': false},
    {'label': 'Legal', 'value': false},
    {'label': 'Warehouse & Operations', 'value': false},
    {'label': 'Beauty & Wellness', 'value': false},
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Container(
            width: 1.sw,
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: R.theme.color200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(R.image.ic_job, color: R.theme.green),
                12.sbw,
                Expanded(
                  child: Text(
                    selectedLabel,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      // color: Colors.black,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  R.image.ic_arrow_down,
                  color: R.theme.color500,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            width: 1.sw,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: Colors.white,
              border: Border.all(color: R.theme.color200),
            ),
            child: Obx(
                  () => Column(
                children: items
                    .map(
                      (item) => ListTile(
                    // title: Text(item['label']),
                    title: MyText(
                      text: item['label'],
                      fontSize: 14,
                      color: item['label'] == selectedLabel
                          ? R.theme.selectedStar
                          : null,
                      fontWeight: item['label'] == selectedLabel
                          ? FontWeight.w900
                          : null,
                      textAlign: TextAlign.left,
                    ),
                    onTap: () {
                      setState(() {
                        selectedLabel = item['label'];
                        isDropdownOpen = false;
                      });
                    },
                  ),
                )
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}