import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class CustomInputFields extends StatelessWidget {
  const CustomInputFields({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool readOnly;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        autofocus: autofocus,
        controller: controller,
        textInputAction: textInputAction,
        cursorColor: AppColor.black,
        cursorWidth: 1,
        decoration: InputDecoration(
          hintText: hintText,
          labelStyle: AppTextStyle.body2Nor.copyWith(color: AppColor.lightGrey2),
          hintStyle: AppTextStyle.body2Nor.copyWith(color: AppColor.lightGrey2),
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          prefixIcon: prefixIcon != null
              ? Padding(padding: const EdgeInsets.fromLTRB(20, 20, 12, 20), child: prefixIcon)
              : null,
          suffixIcon: suffixIcon,
          fillColor: AppColor.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.white,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
