import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetailsSection(),
          ),
          _buildAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildProductDetailsSection() {
    return SingleChildScrollView(
      child: Column(children: [
        const ProductImageSlider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildNameAndQuantitySection(),
            _buildRatingAndReviewSection(),
            ColorPicker(color: const [
              Colors.red,
              Colors.green,
              Colors.cyanAccent,
              Colors.deepPurpleAccent
            ], onColorSelected: (color) {}),
            const SizedBox(height: 10),
            SizePicker(
                size: const ['M', 'L', 'S', 'XX', 'XXL'],
                onSizeSelected: (String onSelectedSize) {}),
            const SizedBox(height: 10),
            _buildDescriptionSection(),
          ]),
        ),
      ]),
    );
  }

  Widget _buildDescriptionSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10),
        Text(
          textAlign: TextAlign.justify,
          '''A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. ''',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Happy new year product discount 20%',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '4',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reviews',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.themeColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_outline,
              size: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAddToCartSection() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$100',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
