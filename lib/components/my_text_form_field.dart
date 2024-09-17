import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    required this.hinttxt,
    this.suffixIcon,
    required this.prefixIcon,
    this.validator,
    required this.controller,
    this.obscureTxt = false,
    this.onChange,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
  });

  final String hinttxt;
  final String prefixIcon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureTxt;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final ValueChanged<String>? onChange;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final FocusNode _focusNode = FocusNode(); // FocusNode to track focus changes
  bool _isFocused = false; // To track if the TextFormField is focused
  // var _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    // _passwordVisible = false;
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: _isFocused ? red : color200),
        ),
      ),
      child: TextFormField(
        onChanged: widget.onChange,
        focusNode: _focusNode,
        readOnly: widget.readOnly,
        obscureText: widget.obscureTxt,
        // obscureText: widget.obscureTxt ? !_passwordVisible : false,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: primaryColor,
        maxLines: 1,
        style: GoogleFonts.inter().copyWith(
          color: primaryColor,
          // fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: 12,
          ),
          hintText: widget.hinttxt,
          hintStyle: GoogleFonts.inter().copyWith(
            color: color400,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SvgPicture.asset(
              widget.suffixIcon ?? '',
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: 14),
            child: SvgPicture.asset(
              widget.prefixIcon,
              color: _isFocused ? primaryColor : color400,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
