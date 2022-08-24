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
    return BlocConsumer<ColorPickerCubit, ColorPickerState>(
      listener: (context, state) {
        controller.text = state.selected!.toHexTriplet();
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: state.textFieldFocused,
                child: AnimatedContainer(
                  duration: Durations.medium,
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColor.lightGrey4,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.cross,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
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
                            onSubmitted: (_) => context.read<ColorPickerCubit>().updateTextFieldFocus(isFocused: false),
                            onTap: () => context.read<ColorPickerCubit>().updateTextFieldFocus(isFocused: true),
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
                          color: state.selected,
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
              Visibility(
                visible: state.textFieldFocused,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColor.primary60,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.tick,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
