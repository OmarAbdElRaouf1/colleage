import 'package:collage/core/models/product_model.dart';
import 'package:flutter/material.dart';

import 'products_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onToggleFavorite;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onFavoritePressed: () => onToggleFavorite(product),
        );
      },
    );
  }
}
