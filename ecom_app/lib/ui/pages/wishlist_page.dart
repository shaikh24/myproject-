import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/wishlist_state.dart';
import '../../models/product.dart';
import '../widgets/product_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wl = context.watch<WishlistState>();
    final items = wl.items.values.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: items.isEmpty
          ? const Center(child: Text('No items in wishlist'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .70, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: items.length,
              itemBuilder: (_, i) {
                final Product p = items[i];
                return ProductCard(product: p, onTap: () => Navigator.pushNamed(context, '/product', arguments: p.id));
              },
            ),
    );
  }
}
