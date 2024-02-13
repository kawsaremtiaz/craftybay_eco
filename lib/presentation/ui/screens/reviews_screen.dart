import 'package:craftybay/presentation/ui/screens/create_review_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: reviewsCard,
          ),
          totalReviewCountInfo
        ],
      ),
    );
  }

  Container get totalReviewCountInfo {
    return Container(
          decoration: BoxDecoration(
            color: CraftyBayAppColors.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Reviews (1000)",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: CraftyBayAppColors.primaryColor,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.to(const CreateReviewScreen());
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
  }

  Padding get reviewsCard {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (buildContext, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              child: const Icon(Icons.person_outline),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "Rabbil Hassan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 1,
                );
              },
            ),
          );
  }
}
