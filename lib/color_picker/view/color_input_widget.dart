import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:thence_style_guide/utils/extensions.dart';

import '../cubit/color_picker_cubit.dart';

class ColorInputWidget extends StatelessWidget {
  const ColorInputWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    void updateColor(String value) {
      if (value.trim().length != 7) return;

      final colorValue = int.tryParse('0xff${value.replaceAll('#', '').trim()}');
      if (colorValue != null) {
        context.read<ColorPickerCubit>().changeColor(Color(colorValue));
      }
    }

    return BlocConsumer<ColorPickerCubit, ColorPickerState>(
      listener: (context, state) {
        controller.text = state.selectedColor!.toHexTriplet();
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconButton(AppIcons.cross, AppColor.lightGrey4, () {}),
              AnimatedContainer(
                duration: Durations.medium,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.textFieldFocused ? AppColor.primary : AppColor.lightGrey3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 102,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: IntrinsicWidth(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration.collapsed(hintText: ''),
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: updateColor,
                            onSubmitted: (value) {
                              updateColor(value);
                              context.read<ColorPickerCubit>().updateTextFieldFocus(isFocused: false);
                            },
                            onTap: () {
                              context.read<ColorPickerCubit>().updateTextFieldFocus(isFocused: true);
                              controller.selection =
                                  TextSelection.fromPosition(TextPosition(offset: controller.text.length));
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 46,
                      child: VerticalDivider(
                        width: 0,
                        color: AppColor.lightGrey3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: state.selectedColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 8,
                              color: const Color(0xff3A4252).withOpacity(0.16),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _iconButton(AppIcons.tick, AppColor.primary60, () {}),
            ],
          ),
        );
      },
    );
  }

  Widget _iconButton(String icon, Color color, VoidCallback onTap) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      builder: (context, state) {
        return AnimatedOpacity(
          duration: Durations.fastest,
          opacity: state.textFieldFocused ? 1 : 0,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset(
                icon,
                color: AppColor.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
