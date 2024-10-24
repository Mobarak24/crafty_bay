import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorinzantalProductListView extends StatelessWidget {
  const HorinzantalProductListView({
    super.key, required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return  ProductCard(productList: productList[index],);
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}