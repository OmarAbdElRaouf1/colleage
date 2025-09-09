import 'dart:convert';
import 'package:collage/core/models/product_model.dart';
import 'package:collage/features/home/presentation/views/widgets/category_tabs.dart';
import 'package:collage/features/home/presentation/views/widgets/products_GridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WishListVeiw extends StatefulWidget {
  const WishListVeiw({super.key});

  @override
  State<WishListVeiw> createState() => _WishListVeiwState();
}

class _WishListVeiwState extends State<WishListVeiw> {
  List<Product> products = [];
  String selectedCategory = "Blazar";
  final categories = [
    "All",
    "Blazar",
    "Shirt",
    "Pant",
    "Shoes"
  ];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/wishlist.json');
    final data = json.decode(response) as List;
    setState(() {
      products = data.map((e) => Product.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          CategoryTabs(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (cat) {
              setState(() {
                selectedCategory = cat;
              });
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ProductGrid(
              products: products,
              onToggleFavorite: (product) {
                setState(() {
                  product.isFavorite = !product.isFavorite;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
