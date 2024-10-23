import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/models/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  ProductDetailsModel? _productDetails;

  ProductDetailsModel? get productDetails => _productDetails;

  Future<bool> getProductDetailsById(int productId) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productDetailsByIdUrl(productId));
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _productDetails = ProductDetailsModel.fromJson(response.responseData['data'][0]);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
