import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  final List<ProductModel> favoriteProducts;

  const FavoritesPage({super.key, required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteProducts.length,
          itemBuilder: (_, index) {
            final product = favoriteProducts[index];
            return Card(
              child: ListTile(
                leading: Image.network(product.imgUrl),
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
