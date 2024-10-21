import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_detatils_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productList,
  });

  final ProductModel productList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => const ProductDetailsScreen());
      },
      child: Card(
        elevation: 3,
        child: SizedBox(
          width: 140 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  image:  DecorationImage(
                      image: NetworkImage(productList.image ?? ''),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(productList.title ?? ''),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('\$${productList.price}'),
                       Wrap(
                        children: [
                          const Icon(Icons.star,color: Colors.amber,),
                          Text ('${productList.star}')
                        ],
                      ),
                      Card(
                        color: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_outline,size: 16,),
                        ),
                      )
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}