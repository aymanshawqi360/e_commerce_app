import 'package:e_commerce_app/core/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160 / 294,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
