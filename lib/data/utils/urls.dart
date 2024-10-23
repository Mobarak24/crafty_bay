class Urls{
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  static const String sliderListUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';

  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByIdUrl(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String verifyEmailUrl(String email) =>
      '$_baseUrl/UserLogin/$email';

  static String verifyOtpUrl(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';


}