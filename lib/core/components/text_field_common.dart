import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    super.key,
    this.border,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.textAlign,
    this.enabled,
    this.keyboardType,
    this.style,
    this.prefix,
    this.fillColor,
    this.focusNode,
    this.maxLines,
    this.cursorColor,
    this.minLines,
    this.onChanged,this.onTap,
    this.labelText,
    this.hintStyle,
    this.filled,
    this.labelStyle,this.focusedBorder,this.obscureText = false,
  });
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final TextStyle? style;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Color? fillColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool obscureText;
  final void Function()? onTap;
  final Color? cursorColor;
  final void Function(String)? onChanged;
  final int? minLines;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: obscureText,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      focusNode: focusNode,
      cursorColor: cursorColor ?? kBlack,
      style: style,
      keyboardType: keyboardType,
      controller: controller,
      enabled: enabled,
      textAlign: textAlign??TextAlign.start,
      decoration: InputDecoration(
        prefix: prefix,
        filled: filled,
        labelText: labelText,
        fillColor: fillColor ?? kTransparent,
        border: border,
        disabledBorder: border,
        enabledBorder: border,
        focusedBorder: focusedBorder?? border,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelStyle: labelStyle,
        hintStyle: hintStyle?? const TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal,color: ksmallDarkGrey,
        ),
      ),
    );
  }
}