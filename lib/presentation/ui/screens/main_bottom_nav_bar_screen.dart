import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
   final BottomNavBarController _bottomNavController = Get.find<BottomNavBarController>();

  final List<Widget> _screen = const [
    HomeScreen(),
    CategoriesListScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomNavBarController>(
      builder: (_) {
        return Scaffold(
          body: _screen[_bottomNavController.selectIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _bottomNavController.selectIndex,
            onDestinationSelected: _bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Category'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.favorite_outline_outlined), label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}
