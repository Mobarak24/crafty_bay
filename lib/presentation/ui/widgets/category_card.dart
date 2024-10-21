
import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() =>  ProductListScreen(categoryModel: categoryModel));
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(categoryModel.categoryImg ?? '',)
              ),
            ),
            // child: Icon(
            //   Icons.computer_outlined,
            //   size: 48,
            //   color: AppColors.themeColor.withOpacity(0.5),
            // ),
          ),
          Text(
            categoryModel.categoryName ?? '',
            style:
            TextStyle(color: AppColors.themeColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}