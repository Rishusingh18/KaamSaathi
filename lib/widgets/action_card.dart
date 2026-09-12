import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ActionCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? topBorderColor;

  const ActionCard({
    Key? key,
    required this.child,
    this.onTap,
    this.topBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withOpacity(0.04),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (topBorderColor != null)
            Container(
              height: 3,
              width: double.infinity,
              color: topBorderColor,
              margin: const EdgeInsets.only(bottom: 12),
            ),
          child,
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
