import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/color_picker/view/color_input_widget.dart';
import 'package:thence_style_guide/utils/extensions.dart';

import '../cubit/color_picker_cubit.dart';

class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({super.key, this.defaultColor});

  final Color? defaultColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorPickerCubit(),
      child: ColorPickerView(defaultColor: defaultColor ?? AppColor.primary),
    );
  }
}

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({super.key, required this.defaultColor});
  final Color defaultColor;
  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  TextEditingController controller = TextEditingController();
  late Color defaultColor;

  @override
  void initState() {
    super.initState();

    defaultColor = widget.defaultColor;
    controller.text = defaultColor.toHexTriplet();
    context.read<ColorPickerCubit>().changeColor(defaultColor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 32),
        ColorInputWidget(controller: controller),
        const SizedBox(height: 32),
        _buildColorWheel(context),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildColorWheel(BuildContext context) {
    final mq = MediaQuery.of(context);
    final colorWheelHeight = mq.size.width - 64;
    final keyboardHeight = (mq.viewInsets.bottom - (56 + 48)) < 0 ? 0.0 : (mq.viewInsets.bottom - (56 + 48));

    return BlocSelector<ColorPickerCubit, ColorPickerState, bool>(
      selector: (state) {
        defaultColor = state.selected!;
        return state.textFieldFocused;
      },
      builder: (context, textFieldFocused) {
        return AnimatedContainer(
          duration: Durations.medium,
          height: textFieldFocused ? keyboardHeight : colorWheelHeight + 30,
          child: textFieldFocused
              ? null
              : HueRingPicker(
                  pickerAreaBorderRadius: BorderRadius.circular(1000),
                  colorPickerHeight: colorWheelHeight,
                  pickerColor: defaultColor,
                  onColorChanged: (color) => context.read<ColorPickerCubit>().changeColor(color),
                  hueRingStrokeWidth: 40,
                ),
        );
      },
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              title: 'Discard',
              buttonType: ButtonType.outlined,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AppButton(
              title: 'Apply',
              onTap: () => Navigator.of(context).pop(context.read<ColorPickerCubit>().state.selected),
            ),
          )
        ],
      ),
    );
  }
}
