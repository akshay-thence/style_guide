// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_repository/style_guide_repository.dart';
import 'package:style_guide_ui/style_guide_ui.dart';

import 'package:thence_style_guide/routes.dart';

import '../cubit/import_fonts_cubit.dart';

class SearchFontPage extends StatefulWidget {
  const SearchFontPage({super.key});

  @override
  State<SearchFontPage> createState() => _SearchFontPageState();
}

class _SearchFontPageState extends State<SearchFontPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ImportFontsCubit>().fetchAllGoogleFonts();
    _searchController.addListener(() {
      context.read<ImportFontsCubit>().searchGoogleFont(_searchController.text);
    });
  }

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
            _buildSearchBar(prefixIcon),
            const SizedBox(height: 12),
            const _SearchResultWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(GestureDetector prefixIcon) {
    return Hero(
      tag: 'search_font',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomInputFields(
          controller: _searchController,
          autofocus: true,
          hintText: 'Search ',
          prefixIcon: prefixIcon,
          suffixIcon: GestureDetector(
            onTap: _searchController.clear,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                'Clear',
                style: AppTextStyle.caption1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchResultWidget extends StatelessWidget {
  const _SearchResultWidget();

  @override
  Widget build(BuildContext context) {
    // update [ImportFontsCubit] bloc and navigate to selected font preview screen
    Future<void> pickFont(GoogleFontModel selectedFont, {required bool isPrimary}) async {
      context.read<ImportFontsCubit>().selectFont(selectedFont: selectedFont, isPrimary: isPrimary);
      await Future<void>.delayed(Durations.fast);
      await Navigator.of(context).pushNamed(AppRouter.selectedFont);
    }

    return BlocBuilder<ImportFontsCubit, ImportFontsState>(
      builder: (context, state) {
        if (state.searchResult.isEmpty) return const SizedBox.shrink();
        return Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
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
            child: BlocBuilder<ImportFontsCubit, ImportFontsState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: state.searchResult.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColor.lightGrey3,
                    height: 0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _ListTile(
                      key: UniqueKey(),
                      onTap: () => pickFont(state.searchResult[index], isPrimary: true),
                      title: state.searchResult[index].family ?? '',
                      isSelected: state.primaryFont?.fontStyle == state.searchResult[index].family,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.body2Nor,
            ),
            if (isSelected)
              SvgPicture.asset(
                AppIcons.tick,
                color: AppColor.primary,
              )
          ],
        ),
      ),
    );
  }
}
