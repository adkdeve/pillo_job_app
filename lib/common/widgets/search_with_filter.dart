import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../app/modules/main/explore/views/filter_view.dart';

class SearchFilterInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onFilterTap;
  final VoidCallback? onTextChanged;

  const SearchFilterInput({
    super.key,
    this.controller,
    this.hintText,
    this.onFilterTap,
    this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 52,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConfig.defaultPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: R.theme.color400),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(R.image.ic_search),
          Expanded(
            child: TextFormField(
              controller: controller,
              maxLines: 1,
              style: GoogleFonts.inter().copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding / 1.5,
                  vertical: 12,
                ),
                hintText: hintText ?? LocaleKeys.search_alert.tr,
                hintStyle: GoogleFonts.inter().copyWith(
                  color: R.theme.color400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
                border: InputBorder.none,
              ),
              onChanged: (_) => onTextChanged?.call(),
            ),
          ),
          GestureDetector(
            onTap: onFilterTap ??
                    () async {
                  var data = await Get.to(() => const FilterView());
                  if (data != null) {
                    // Handle returned filter data if needed
                  }
                },
            child: SvgPicture.asset(R.image.ic_filter),
          ),
        ],
      ),
    );
  }
}
