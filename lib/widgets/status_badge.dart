import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum BadgeType { success, warning, info, error }

class StatusBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final IconData? icon;

  const StatusBadge({
    Key? key,
    required this.text,
    this.type = BadgeType.success,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    switch (type) {
      case BadgeType.success:
        backgroundColor = const Color(0xFFF0FDF4);
        textColor = AppColors.statusSuccess;
        borderColor = const Color(0xFFBBF7D0);
        break;
      case BadgeType.warning:
        backgroundColor = const Color(0xFFFFFBEB);
        textColor = AppColors.statusWarning;
        borderColor = const Color(0xFFFDE68A);
        break;
      case BadgeType.error:
        backgroundColor = const Color(0xFFFEF2F2);
        textColor = AppColors.statusError;
        borderColor = const Color(0xFFFECACA);
        break;
      case BadgeType.info:
      default:
        backgroundColor = const Color(0xFFEFF6FF);
        textColor = AppColors.statusInfo;
        borderColor = const Color(0xFFBFDBFE);
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
