import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/data_service.dart';
import '../../models/product.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatefulWidget {
  final String subcategoryId;
  const ProductListPage({super.key, required this.subcategoryId});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<DataService>(context);
    List<Product> items = ds.products.where((p) => p.subcategoryId == widget.subcategoryId).toList();
    if (_query.isNotEmpty) {
      items = items.where((p) => p.title.toLowerCase().contains(_query.toLowerCase())).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search in this subcategory',
                filled: true,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .70, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemCount: items.length,
          itemBuilder: (context, i) {
            final p = items[i];
            return ProductCard(product: p, onTap: () => Navigator.pushNamed(context, '/product', arguments: p.id));
          },
        ),
      ),
    );
  }
}
