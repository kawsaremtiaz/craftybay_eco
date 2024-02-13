class Urls {
  static const String _baseUrl = "http://ecom-api.teamrabbil.com/api";

  static String sendEmailOtp(String email) => "$_baseUrl/UserLogin/$email";
  static String otpVerify(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";
  static String checkProfile = "$_baseUrl/ReadProfile";
  static String createProfile = "$_baseUrl/CreateProfile";
  static String homeBanner = "$_baseUrl/ListProductSlider";
  static String categoryList = "$_baseUrl/CategoryList";
  static String popularProductList = "$_baseUrl/ListProductByRemark/popular";
  static String specialProductList = "$_baseUrl/ListProductByRemark/special";
  static String newProductList = "$_baseUrl/ListProductByRemark/new";
  static String productsByCategory(int categoryId) =>
      "$_baseUrl/ListProductByCategory/$categoryId";
  static String productDetails(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";

  static String addToCart=
      "$_baseUrl/CreateCartList";

  static String cartList=
      "$_baseUrl/CartList";
}
