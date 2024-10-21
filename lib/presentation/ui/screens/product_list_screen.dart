import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  void initState() {
    super.initState();
    Get.find<ProductListCategoryController>()
        .getProductListCategory(widget.categoryModel.id!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.categoryName ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ProductListCategoryController>(
          builder: (productListCategoryController) {
            if(productListCategoryController.inProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(productListCategoryController.errorMessage != null){
              return Center(child: Text(productListCategoryController.errorMessage!),);
            }
            if(productListCategoryController.productList.isEmpty){
              return const Center(
                child: Text('Product is Empty'),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: productListCategoryController.productList.length,
              itemBuilder: (context, index) {
                return  FittedBox(child: ProductCard(
                  productList: productListCategoryController.productList[index],));
              },
            );
          }
        ),
      ),
    );
  }
}
