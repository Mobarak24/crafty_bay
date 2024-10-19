import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put( BottomNavBarController());
    Get.put( Logger());
    Get.put( NetworkCaller(logger: Get.find<Logger>()));
    Get.put( SliderListController());
  }
}
