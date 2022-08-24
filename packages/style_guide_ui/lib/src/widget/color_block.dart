// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';

class ColorBlock extends StatelessWidget {
  const ColorBlock({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    _buildPopupMenuItem<T>({required T value, required String icon, required String text}) {
      return PopupMenuItem<T>(
        value: value,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: AppColor.grey,
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTextStyle.body2,
            ),
          ],
        ),
      );
    }

    _buildPopupMenuButton() {
      return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            AppIcons.menu,
            color: AppColor.white,
          ),
        ),
        itemBuilder: (_) => <PopupMenuItem<String>>[
          _buildPopupMenuItem(
            value: 'edit',
            icon: AppIcons.edit,
            text: 'Edit color',
          ),
          _buildPopupMenuItem(
            value: 'delete',
            icon: AppIcons.delete,
            text: 'Delete color',
          ),
        ],
      );
    }

    String hexCode = color.value.toRadixString(16).substring(2, 8).toUpperCase();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.topRight,
              child: _buildPopupMenuButton(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            hexCode,
            style: AppTextStyle.body2Nor,
          ),
        ],
      ),
    );
  }
}
