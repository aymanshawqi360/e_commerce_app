import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/assets_manager.dart';

class MyCardsPageView extends StatefulWidget {
  const MyCardsPageView({super.key});

  @override
  State<MyCardsPageView> createState() => _MyCardsPageViewState();
}

class _MyCardsPageViewState extends State<MyCardsPageView> {
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  @override
  void dispose() {
    super.dispose();
    _currentPage.dispose();
  }
  final List<String> assets = [
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card,
    AssetsManager.card,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: assets.map((asset) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: AssetImage(asset,))
              ),
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentPage.value = index;
            },
          ),
        ),
        ValueListenableBuilder<int>(valueListenable: _currentPage, builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: assets.asMap().entries.map((entry) {
              return Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value == entry.key
                      ? ColorsManager.purple
                      : Color(0xffE0E0E5),
                ),
              );
            }).toList(),
          );
        })
      ],
    );
  }
}
