import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 160,
      child: GestureDetector(
        onTap: () {
          Get.to( ProductDetailScreen(productId: product.id!,));
        },
        child: Card(
          elevation: 3,
          color: Colors.white,
          shadowColor: CraftyBayAppColors.primaryColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: CraftyBayAppColors.primaryColor.withOpacity(0.5),
                    // padding: const EdgeInsets.only(bottom: 7),
                    child: Image.network(
                      product.image ?? "",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${product.price ?? 0}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: CraftyBayAppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            Text(
                              "${product.star}",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: CraftyBayAppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
