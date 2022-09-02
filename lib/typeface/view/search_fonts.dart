import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

class SearchFontPage extends StatefulWidget {
  const SearchFontPage({super.key});

  @override
  State<SearchFontPage> createState() => _SearchFontPageState();
}

class _SearchFontPageState extends State<SearchFontPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefixIcon = GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: SvgPicture.asset(
        AppIcons.arrowBack,
        width: 16,
        height: 16,
        color: AppColor.lightGrey1,
      ),
    );

    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Hero(
              tag: 'search_font',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomInputFields(
                  controller: _searchController,
                  autofocus: true,
                  hintText: 'Search ',
                  prefixIcon: prefixIcon,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      'Clear',
                      style: AppTextStyle.caption1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    color: const Color(0xffa1a7b3).withOpacity(0.16),
                  )
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context, index) => const Divider(
                  color: AppColor.lightGrey3,
                  height: 32,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    'Sacramento',
                    style: AppTextStyle.body2Nor,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
