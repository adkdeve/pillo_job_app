import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/add_my_view_alert_view.dart';
import 'package:pillo/app/modules/main/profile/views/my_alert_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/explore_controller.dart';

class FilterView extends GetView<ExploreController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var locContoller = TextEditingController(text: 'St.Catherine, Jamaica');
    return Scaffold(
      backgroundColor: color100,
      appBar: AppBar(
        backgroundColor: color100,
        surfaceTintColor: color100,
        leading: const Padding(
          padding: EdgeInsets.only(top: 8, left: 16, bottom: 8),
          child: MyBackBtn(),
        ),
        centerTitle: true,
        title: const MyText(
          text: 'Filter & Create Alerts',
          fontSize: 22,
          color: primaryColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2,
                    vertical: defaultPadding * 1.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(
                      text: 'Category',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    defaultPadding.sbh,
                    const DropdownWidget(),
                    // Container(
                    //   width: 1.sw,
                    //   height: 52,
                    //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(16),
                    //     border: Border.all(color: color200),
                    //   ),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       SvgPicture.asset(
                    //         ic_job,
                    //         color: green,
                    //       ),
                    //       12.sbw,
                    //       const Expanded(
                    //         child: MyText(
                    //           text: 'Sales & Marketing',
                    //           fontSize: 14,
                    //           textAlign: TextAlign.left,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //       SvgPicture.asset(
                    //         ic_arrow_down,
                    //         color: color500,
                    //         width: 16,
                    //         height: 16,
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    defaultPadding.sbh,
                    const MyText(
                      text: 'Location',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    defaultPadding.sbh,
                    Container(
                      width: 1.sw,
                      height: 52,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: color200),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ic_location,
                            color: green,
                          ),
                          12.sbw,
                          Expanded(
                            child: TextField(
                                controller: locContoller,
                                cursorColor: primaryColor,
                                maxLines: 1,
                                style: GoogleFonts.inter().copyWith(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                )
                                // text: 'St.Catherine, Jamaica',
                                // fontSize: 14,
                                // textAlign: TextAlign.left,
                                // fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    (defaultPadding * 2).sbh,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'Min. Salary',
                          fontSize: 14,
                          color: color600,
                          fontWeight: FontWeight.w500,
                        ),
                        MyText(
                          text: 'Max. Salary',
                          fontSize: 14,
                          color: color600,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const MyRangeSlider(),
                    (defaultPadding).sbh,
                    const MyText(
                      text: 'Job Type',
                      fontSize: 16,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w700,
                    ),
                    (defaultPadding).sbh,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              JobTypeCheckBox(text: 'Full Time'),
                              JobTypeCheckBox(text: 'Part Time'),
                              JobTypeCheckBox(text: 'Freelance'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              JobTypeCheckBox(text: 'Remote'),
                              JobTypeCheckBox(text: 'Contract'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    36.sbh,
                    PrimaryButton(
                      text: 'Apply Filter',
                      onPressed: () {
                        Get.back(result: true);
                      },
                    ),
                    // 8.sbh,
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const AddMyViewAlertView()),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: MyText(
                            text: 'Create Alerts',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: green,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    defaultPadding.sbh,
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class JobTypeCheckBox extends StatefulWidget {
  const JobTypeCheckBox({
    super.key,
    required this.text,
  });
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
          side: const BorderSide(width: 1, color: color300),
          value: checkbox,
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return green;
            } else {
              return Colors.transparent;
            }
          }),
          onChanged: (val) {
            setState(() {
              checkbox = !checkbox;
            });
          },
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
        ),
        4.sbw,
        MyText(
          text: widget.text,
          fontSize: 14,
          color: color500,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({super.key});

  @override
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<MyRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 300);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: 0,
      max: 300,
      divisions: 4,
      activeColor: red,
      inactiveColor: red.withOpacity(0.2),
      labels: RangeLabels(
        '\$${_currentRangeValues.start.round().toString()}k',
        '\$${_currentRangeValues.end.round().toString()}k',
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}

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
              border: Border.all(color: color200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ic_job,
                  color: green,
                ),
                12.sbw,
                Expanded(
                  child: Text(
                    selectedLabel,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  ic_arrow_down,
                  color: color500,
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
              color: Colors.white,
              border: Border.all(color: color200),
            ),
            child: Obx(() => Column(
                  children: items
                      .map((item) => ListTile(
                            // title: Text(item['label']),
                            title: MyText(
                              text: item['label'],
                              fontSize: 14,
                              color: item['label'] == selectedLabel
                                  ? selectedStar
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
                          ))
                      .toList(),
                )),
          ),
      ],
    );
  }
}
