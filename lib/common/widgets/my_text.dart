import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/core/core.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
        required this.text,
        required this.fontSize,
        this.fontWeight,
        this.color,
        this.textAlign = TextAlign.center,
        this.letterSpacing = .3,
        this.height = 0,
        this.maxLines,
        this.overflow,
        this.decoration,
        this.opacity = 1.0});

  final String text;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double opacity;


  @override
  Widget build(BuildContext context) {
    // Apply the opacity to the color if color is provided
    Color? finalColor = color ?? Theme.of(context).textTheme.bodyLarge?.color;  // Default to black if no color is provided
    finalColor = finalColor?.withOpacity(opacity);

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
      style: GoogleFonts.inter().copyWith(
        decoration: decoration,
        height: height,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: (fontWeight ?? FontWeight.w500),
        color: finalColor,
      ),
    );
  }
}
