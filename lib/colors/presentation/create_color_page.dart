import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/routes.dart';

import 'widgets/all_color_category.dart';

class CreateColorPage extends StatelessWidget {
  const CreateColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        trailingIcon: AppIcons.settings,
        onTrailingIconTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const _CreateColorTitle(),
            const AllColorCategoryWidget(
              initiallyExpanded: true,
              showExpandedIcon: false,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: AppButton(
                title: 'Create Style Guide',
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.indexPage);
                  // context.read<SelectedStyleGuideCubit>().createNewStyleGuide();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CreateColorTitle extends StatelessWidget {
  const _CreateColorTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepCountWidget(value: 'Step 1 of 2'),
        const SizedBox(height: 18),
        Text(
          'Superb! 👍',
          style: AppTextStyle.h2,
        ),
        const SizedBox(height: 8),
        Text(
          'Make Changes if You Want',
          style: AppTextStyle.subtitle.copyWith(color: AppColor.lightGrey2),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
