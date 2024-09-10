import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HorinzantalProductListView extends StatelessWidget {
  const HorinzantalProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ProductCard();
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}