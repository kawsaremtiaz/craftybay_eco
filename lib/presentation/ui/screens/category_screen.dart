import 'package:craftybay/presentation/state_holders/category_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/widgets/category_item.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            "Categories",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: false,
          elevation: 3,
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CategoryController>().getCategoryList();
          },
          child: GetBuilder<CategoryController>(
            builder: (categoryController) {
              return Visibility(
                visible: categoryController.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8),
                  itemCount: categoryController.categories.categoryList?.length ?? 0,
                  itemBuilder: (buildContext, index) {
                    return FittedBox(
                        child: CategoryItem(category: categoryController.categories.categoryList![index]),
                    );
                  },
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
