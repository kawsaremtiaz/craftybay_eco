import 'package:craftybay/presentation/state_holders/all_product_controller.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category, required this.categoryId});

  final String? category;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.categoryId != null) {
        Get.find<ProductController>()
            .getProductList(categoryId: widget.categoryId!);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? "Product"),
        centerTitle: false,
      ),
      body: GetBuilder<ProductController>(builder: (productController) {
        return Visibility(
          visible: productController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: Visibility(
            visible: productController.productListModel.productDataList?.isNotEmpty ?? false,
            replacement: const Center(
              child: Text("No Products"),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.90,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8),
              itemCount:
                  productController.productListModel.productDataList?.length ?? 0,
              itemBuilder: (buildContext, index) {
                return FittedBox(
                  child: ProductCardItem(
                    product: productController
                        .productListModel.productDataList![index],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
