import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';

class ProductImageCaurosel extends StatefulWidget {
  const ProductImageCaurosel({
    super.key,
    required this.iUrls,
     this.height,
  });
  final double? height;
  final List<String> iUrls;

  @override
  State<ProductImageCaurosel> createState() => _ProductImageCauroselState();
}

class _ProductImageCauroselState extends State<ProductImageCaurosel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              },
              viewportFraction: 1),
          items: widget.iUrls.map((iUrls) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: NetworkImage(iUrls), fit: BoxFit.cover)),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.iUrls.length; i++)
                      Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: i == index
                              ? CraftyBayAppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                              color: i == index
                                  ? CraftyBayAppColors.primaryColor
                                  : Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
