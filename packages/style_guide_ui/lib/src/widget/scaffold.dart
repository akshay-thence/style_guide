// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.floatingActionButton,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.white,
                  Color(0xffF7F9FC),
                ],
              ),
            ),
          ),
          if (body != null) body!,
        ],
      ),
    );
  }
}
