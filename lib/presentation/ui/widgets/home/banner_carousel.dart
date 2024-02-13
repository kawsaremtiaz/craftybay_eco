import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/data/models/banner.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    this.height,
    required this.bannerList,
  });

  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 150.0,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              },
              viewportFraction: 1),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: CraftyBayAppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(banner.image ?? ""),
                      fit: BoxFit.cover
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                    Text(
                      banner.title ?? '',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: CraftyBayAppColors.primaryColor,
                            fontSize: 10),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white),
                        padding:
                            MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                              top: 0.0,
                              bottom: 0.0),
                        ),
                      ),
                    ),
                                            ],
                                          ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.bannerList.length; i++)
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: i == index
                            ? CraftyBayAppColors.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                            color: i == index
                                ? CraftyBayAppColors.primaryColor
                                : Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              );
            })
      ],
    );
  }
}
