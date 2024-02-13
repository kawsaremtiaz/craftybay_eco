import 'package:craftybay/presentation/state_holders/cart_list_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/utility/assets_content_path.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  double unitPrice;
  int quantity;

  Product(this.unitPrice, this.quantity);
}

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  List<Product> products = [
    Product(10.0, 1),
    Product(15.0, 1),
    Product(20.0, 1),
    Product(30.0, 1),
    Product(40.0, 1),
    Product(50.0, 1),
    Product(60.0, 1),
    Product(26.0, 1),
    Product(27.0, 1),
    Product(23.0, 1),
  ];
  void _incrementQuantity(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index].quantity > 1) {
        products[index].quantity--;
      }
    });
  }

  double _calculateTotalPrice(int index) {
    return products[index].unitPrice * products[index].quantity;
  }

  int itemTotalPrice = 100;
  _totalPriceAmmount() {
    double totalPriceAmo = 0.0;
    for (int i = 0; i < products.length; i++) {

        totalPriceAmo += _calculateTotalPrice(i);

    }
    return Text("${totalPriceAmo.toString()}\$",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Carts"),
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: GetBuilder<CartListController>(builder: (cartListController) {
            if (cartListController.inProgress == true) {
              return const CenterCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartListController.cartListModels.cartListModelItemData?.length ?? 0,
                    itemBuilder: (buildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AssetsContentPath.productImage,
                                      width: 80,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Best HP Laptop in 2024 edition",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Color: Black,",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "Size: 16 Inc",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: const Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${products[index].unitPrice * products[index].quantity}",
                                                style: const TextStyle(
                                                    color: CraftyBayAppColors
                                                        .primaryColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              productIncrementAndDecrementSection(
                                                  index)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 1.0,
                      );
                    },
                  ),
                ),
                Container(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          Container(child: _totalPriceAmmount(),
                              ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Checkout"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }

  Row productIncrementAndDecrementSection(int index) {
    return Row(
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
              onPressed: () {
                _incrementQuantity(index);
              },
              icon: const Icon(
                CupertinoIcons.plus,
                size: 10,
                color: Colors.white,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("${products[index].quantity}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
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
            onPressed: () {
              _decrementQuantity(index);
            },
            icon: const Icon(
              CupertinoIcons.minus,
              size: 10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
