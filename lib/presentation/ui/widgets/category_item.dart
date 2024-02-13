import 'package:craftybay/data/models/categories_list.dart';
import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CatagoryListItem category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          category: category.categoryName ?? "Uncategory",
          categoryId: category.id,
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: CraftyBayAppColors.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                category.categoryImg ?? "",
                width: 70,
                height: 60,
              ),
            ),
          ),
          Text(
            category.categoryName ?? "",
            style: const TextStyle(
                color: CraftyBayAppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
