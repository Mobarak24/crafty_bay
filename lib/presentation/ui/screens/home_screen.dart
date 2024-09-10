import 'package:crafty_bay/presentation/ui/screens/categories_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/appbar_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/horizontal_caregories_list_view.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/horizontal_product_list_view.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchTextField(
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 16),
              const HomeBannerSlider(),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              _buildPopularProductSection(),
              const SizedBox(height: 16),
              _buildNewProductSection(),
              const SizedBox(height: 16),
              _buildSpecialProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        HeaderSection(
          title: 'Popular',
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorinzantalProductListView(),
        )
      ],
    );
  }

  Widget _buildNewProductSection() {
    return Column(
      children: [
        HeaderSection(
          title: 'New',
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorinzantalProductListView(),
        )
      ],
    );
  }

  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        HeaderSection(
          title: 'Special',
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorinzantalProductListView(),
        )
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        HeaderSection(
          title: ' All Categories',
          onTap: () {
            Get.to(() => const CategoriesListScreen());
          },
        ),
        const SizedBox(height: 12),
        const SizedBox(
          height: 120,
          child: HorizontalCategoryListView(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(width: 8),
        AppbarIconButton(
          onTap: () {},
          iconData: Icons.notification_add,
        ),
      ],
    );
  }
}
