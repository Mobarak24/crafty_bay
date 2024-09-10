import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.computer_outlined,
            size: 48,
            color: AppColors.themeColor.withOpacity(0.5),
          ),
        ),
        Text(
          'Computer',
          style:
          TextStyle(color: AppColors.themeColor.withOpacity(0.5)),
        ),
      ],
    );
  }
}