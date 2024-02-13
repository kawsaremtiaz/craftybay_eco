import 'package:craftybay/data/models/product_details_model_data.dart';
import 'package:craftybay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:craftybay/presentation/state_holders/product_details_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/email_verify_screen.dart';
import 'package:craftybay/presentation/ui/screens/reviews_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/product_image_Carousel.dart';
import 'package:craftybay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.height,
    required this.productId,
  });
  final double? height;
  final int productId;


  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Color? _selectedColor;
  String? _selectedSize;
  final int _quantity = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productDetailsController = Get.find<ProductDetailsController>();
      productDetailsController.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: false,
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCaurosel(
                      iUrls: [
                        productDetailsController.productDetailsByIdModel.img1 ??
                            "",
                        productDetailsController.productDetailsByIdModel.img2 ??
                            "",
                        productDetailsController.productDetailsByIdModel.img3 ??
                            "",
                        productDetailsController.productDetailsByIdModel.img4 ??
                            "",
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    productDetailsBody(
                        productDetailsController.productDetailsByIdModel)
                  ],
                ),
              ),
            ),
            priceAddToCartSection
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(
      ProductDetailsByIdModelData productDetailsByIdModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetailsByIdModel.product?.title ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              // ProductQtyMenagment()
              Row(
                children: [
                  Container(
                      height: 24,
                      width: 30,
                      decoration: BoxDecoration(
                          color: CraftyBayAppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.plus,
                          size: 10,
                          color: Colors.white,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 30,
                    decoration: BoxDecoration(
                        color: CraftyBayAppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                          )
                        ]),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.minus,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          // ValueListenableBuilder(
          //     valueListenable: noOfItems,
          //     builder: (context, value, _) {
          //       return ItemCount(
          //         initialValue: value,
          //         minValue: 1,
          //         maxValue: 20,
          //         decimalPlaces: 0,
          //         step: 1,
          //         color: CraftyBayAppColors.primaryColor,
          //         onChanged: (v) {
          //           noOfItems.value = v.toInt();
          //         },
          //       );
          //     }),
          ratingAndReviews(productDetailsByIdModel.product?.star ?? 0),
          const SizedBox(
            height: 8,
          ),
          const Text("Color",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
          ColorSelector(
            colors: productDetailsByIdModel.color
                    ?.split(",")
                    .map((e) => getColorCodeFromDatabaseColorCode(e))
                    .toList() ??
                [],
            onChange: (selectedColor) {
              _selectedColor = selectedColor;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Size",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
          SizeSelector(
            sizes: productDetailsByIdModel.size?.split(",") ?? [],
            onChange: (s) {
              _selectedSize = s;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text("Description",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87)),
          const SizedBox(
            height: 8,
          ),
          Text(
            productDetailsByIdModel.des ?? "",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  Row ratingAndReviews(int rating) {
    return Row(
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {
            Get.to(const ReviewsScreen());
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Text(
            "Reviews",
            style: TextStyle(
                fontSize: 14,
                color: CraftyBayAppColors.primaryColor,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: CraftyBayAppColors.primaryColor,
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.favorite_outline,
              size: 14,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  // Row productIncrementAndDecrementSection() {
  //   return Row(
  //     children: [
  //       Container(
  //           height: 24,
  //           width: 30,
  //           decoration: BoxDecoration(
  //               color: CraftyBayAppColors.primaryColor,
  //               borderRadius: BorderRadius.circular(5),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.5),
  //                   spreadRadius: 1,
  //                   blurRadius: 10,
  //                 )
  //               ]),
  //           child: IconButton(
  //             onPressed: () {},
  //             icon: const Icon(
  //               CupertinoIcons.plus,
  //               size: 10,
  //               color: Colors.white,
  //             ),
  //           )),
  //       const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 8.0),
  //         child: Text("01",
  //             style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black)),
  //       ),
  //       Container(
  //         height: 24,
  //         width: 30,
  //         decoration: BoxDecoration(
  //             color: CraftyBayAppColors.primaryColor,
  //             borderRadius: BorderRadius.circular(5),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5),
  //                 spreadRadius: 2,
  //                 blurRadius: 10,
  //               )
  //             ]),
  //         child: IconButton(
  //           onPressed: () {},
  //           icon: const Icon(
  //             CupertinoIcons.minus,
  //             size: 10,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Container get priceAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CraftyBayAppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              Text(
                "\$1000",
                style: TextStyle(
                    color: CraftyBayAppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      if (Get.find<CatchAuthController>().isTokenNotNull) {
                        final submitSelectedColor =
                            submitColorCodeToDatabase(_selectedColor!);
                        final response = await addToCartController.addToCart(
                            widget.productId,
                            submitSelectedColor,
                            _selectedSize!,
                            _quantity);
                        if (response) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "Success",
                              message: "This product has been added to cart",
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: "Add to cart failed",
                              message: addToCartController.errorMessage,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      } else {
                        Get.to(() => const EmailVerifyScreen());
                      }
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Add to cart failed",
                          message: "Please select color and size",
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text("Add to Cart"),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Color getColorCodeFromDatabaseColorCode(String color) {
    color = color.toLowerCase();
    if (color == "red") {
      return Colors.red;
    } else if (color == "white") {
      return Colors.white;
    } else if (color == "green") {
      return Colors.green;
    }
    return Colors.grey;
  }

  String submitColorCodeToDatabase(Color color) {
    if (color == Colors.red) {
      return "Red";
    } else if (color == Colors.white) {
      return "White";
    } else if (color == Colors.green) {
      return "Green";
    }
    return "grey";
  }
  // Color getColorFromString(String colorCode) {
  //   String code = colorCode.replaceAll("#", "");
  //   String hexCode = "FF$code";
  //   return Color(int.parse('0x$hexCode'));
  // }
  //
  // String colorToHashColorCode(String colorCode) {
  //   return _selectedColor
  //       .toString()
  //       .replaceAll("0xff", "#")
  //       .replaceAll("Color(", "")
  //       .replaceAll(")", "");
  // }
}
