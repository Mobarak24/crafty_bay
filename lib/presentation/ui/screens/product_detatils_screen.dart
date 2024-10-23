import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

   String _selectedSize = '';
   String _selectedColors = '';
   int quantity = 1;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().
    getProductDetailsById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.inProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(productDetailsController.errorMessage != null){
            return Text(productDetailsController.errorMessage!);
          }
          return Column(
            children: [
              Expanded(
                child: _buildProductDetailsSection(productDetailsController.productDetails!),
              ),
              _buildAddToCartSection(),
            ],
          );
        }
      ),
    );
  }

  Widget _buildProductDetailsSection(ProductDetailsModel productDetails) {

    List<String> size = productDetails.size!.split(',');
    List<String> color = productDetails.color!.split(',');
    _selectedSize = size.first;

    return SingleChildScrollView(
      child: Column(children: [
        ProductImageSlider(
          imageSlider: [
            productDetails.img1!,
            productDetails.img2!,
            productDetails.img3!,
            productDetails.img4!,
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildNameAndQuantitySection(productDetails),
            _buildRatingAndReviewSection(productDetails),
            // ColorPicker(
            //     color: const [
            //   Colors.red,
            //   Colors.green,
            //   Colors.cyanAccent,
            //   Colors.deepPurpleAccent
            // ], onColorSelected: (color) {}),
                SizePicker(
                    size: color,
                    onSizeSelected: (String onSelectedSize) {
                      _selectedColors = onSelectedSize;
                    }),
            const SizedBox(height: 10),
            SizePicker(
                size: size,
                onSizeSelected: (String onSelectedSize) {
                  _selectedSize = onSelectedSize;
                }),
            const SizedBox(height: 10),
            _buildDescriptionSection(productDetails),
          ]),
        ),
      ]),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productDetails) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description' ,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          productDetails.product?.shortDes ?? '',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productDetails) {
    return Row(
      children: [
        Expanded(
          child: Text(
            productDetails.product?.title ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ItemCount(
          initialValue: quantity,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {
            quantity = value.toInt();
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
         Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '${productDetails.product?.star ?? ''}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                onPressed: _addToCart,
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addToCart() async{

    bool isLoggedInUser = await Get.find<AuthController>().isLoggedInUser();

    if(isLoggedInUser){
      
    }else{
      Get.to(() => const EmailVerificationScreen());
    }

  }
}
