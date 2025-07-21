import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';
import '../../../app/core/core.dart';
import 'job_description_container.dart';
import 'my_text.dart';


class CustomCard extends StatelessWidget {
  final String title;
  final String location;
  final String img;
  final String type;
  final String jobType;
  final String posted;
  final int applications;
  final RxBool isFavorite; // Make this an observable boolean
  final VoidCallback onFavoriteToggle;
  final bool isJobListCard; // Whether it's for the JobList or the other card

  const CustomCard({
    super.key,
    required this.title,
    required this.location,
    required this.img,
    required this.type,
    required this.jobType,
    required this.posted,
    required this.applications,
    required this.isFavorite,
    required this.onFavoriteToggle,
    this.isJobListCard = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      padding: EdgeInsets.all(AppConfig.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppThemeData.lightBoxDecorationColor
            : AppThemeData.darkBoxDecorationColor,
        borderRadius: BorderRadius.circular(AppConfig.defaultPadding),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: ShapeDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? R.theme.white
                      : R.theme.color600,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(AppConfig.defaultPadding),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    img,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  MyText(
                    text: title,
                    fontSize: 16,
                    color: R.theme.black,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    text: location,
                    fontSize: 14,
                    height: 2,
                    color: R.theme.green,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              Obx(() => GestureDetector(
                onTap: onFavoriteToggle,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: AppConfig.defaultPadding / 1.5,
                    top: AppConfig.defaultPadding / 2,
                  ),
                  child: SvgPicture.asset(
                    isFavorite.value ? R.image.ic_heart : R.image.ic_heart_un,
                  ),
                ),
              )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              customJobDescriptionContainer(
                context: context,
                text: type,
                fontSize: 11,
                lightColor: R.theme.white,
                darkColor: R.theme.color600,
                borderRadius: AppConfig.defaultPadding,
              ),
              (AppConfig.defaultPadding / 2).sbw,
              customJobDescriptionContainer(
                context: context,
                text: jobType,
                fontSize: 11,
                lightColor: R.theme.white,
                darkColor: R.theme.color600,
                borderRadius: AppConfig.defaultPadding,
              ),
              (AppConfig.defaultPadding / 2).sbw,
              customJobDescriptionContainer(
                context: context,
                text: posted,
                fontSize: 11,
                lightColor: R.theme.white,
                darkColor: R.theme.color600,
                borderRadius: AppConfig.defaultPadding,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Applied on',
                    fontSize: 13,
                    opacity: 0.7,
                    fontWeight: FontWeight.w500,
                  ),
                  4.sbh,
                  MyText(
                    text: 'Jan 10, 2024',
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
          if (isJobListCard) ...[
            Row(
              children: [
                MyText(
                  text: 'Application',
                  fontSize: 12,
                  color: R.theme.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
                4.sbw,
                Row(
                  children: [
                    SvgPicture.asset(R.image.ic_application_filled),
                    MyText(
                      text: applications.toString(),
                      fontSize: 14,
                      letterSpacing: 0.7,
                      color: R.theme.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
