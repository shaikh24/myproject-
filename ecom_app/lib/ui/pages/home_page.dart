import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/data_service.dart';
import '../../state/wishlist_state.dart';
import '../../state/cart_state.dart';
import '../../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<DataService>(context);
    final products = ds.products.take(12).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecom Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/wishlist'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Ecom App')),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () => Navigator.pushNamed(context, '/categories'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Orders'),
              onTap: () => Navigator.pushNamed(context, '/orders'),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Support Chat'),
              onTap: () => Navigator.pushNamed(context, '/support'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .70,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, i) {
            final Product p = products[i];
            return ProductCard(
              product: p,
              onTap: () => Navigator.pushNamed(context, '/product', arguments: p.id),
            );
          },
        ),
      ),
      floatingActionButton: Consumer<CartState>(
        builder: (_, cart, __) => FloatingActionButton.extended(
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          label: Text('Cart (${cart.items.length})'),
          icon: const Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
