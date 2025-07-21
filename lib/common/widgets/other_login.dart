import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/core/config/app_config.dart';
import '../../app/core/resources/r.dart';

class OtherLogin extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const OtherLogin({
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConfig.defaultPadding),
          border: Border.all(color: R.theme.color400),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppConfig.defaultPadding),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConfig.defaultPadding),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
