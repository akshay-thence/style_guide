import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:style_guide_infra/style_guide_infra.dart';
import 'package:style_guide_ui/src/widget/popup_menu_item.dart';

class ColorBlock extends StatelessWidget {
  const ColorBlock({
    Key? key,
    required this.color,
    this.onEditColor,
    this.onDeleteColor,
  }) : super(key: key);

  final Color color;
  final VoidCallback? onEditColor;
  final VoidCallback? onDeleteColor;

  @override
  Widget build(BuildContext context) {
    _buildPopupMenuButton() {
      return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            AppIcons.menu,
            color: color.isDarkColor() ? AppColor.white : AppColor.lightGrey1,
          ),
        ),
        itemBuilder: (_) => <CustomPopListTile>[
          CustomPopListTile(
            icon: AppIcons.edit,
            text: 'Edit color',
            onTap: onEditColor,
          ),
          CustomPopListTile(
            icon: AppIcons.delete,
            text: 'Delete color',
            onTap: onDeleteColor,
          ),
        ],
      );
    }

    String hexCode = color.value.toRadixString(16).substring(2, 8).toUpperCase();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
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
                border: color == Colors.white ? Border.all(color: AppColor.lightGrey3) : null,
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
