// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({
    super.key,
    required this.params,
  });

  final SuccessScreenParams params;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    initCallBack();
  }

  Future<void> initCallBack() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (widget.params.onDone != null) {
      // ignore: prefer_null_aware_method_calls
      widget.params.onDone!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: CustomScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Image.asset(AppImage.successImage, scale: 2),
            const SizedBox(height: 20),
            Text(widget.params.title, style: AppTextStyle.h2),
            const SizedBox(height: 9),
            Text(widget.params.subTitle, style: AppTextStyle.body2Nor),
          ],
        ),
      ),
    );
  }
}

class SuccessScreenParams {
  SuccessScreenParams({
    this.onDone,
    required this.title,
    required this.subTitle,
  });
  final VoidCallback? onDone;
  final String title;
  final String subTitle;
}
