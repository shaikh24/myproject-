import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/data_service.dart';
import '../../state/cart_state.dart';
import '../../state/wishlist_state.dart';
import '../../models/product.dart';
import '../../utils/formatting.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String? _size;
  String? _color;
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    final ds = Provider.of<DataService>(context);
    final p = ds.products.firstWhere((e) => e.id == widget.productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
        actions: [
          Consumer<WishlistState>(
            builder: (_, wl, __) => IconButton(
              icon: Icon(wl.contains(p.id) ? Icons.favorite : Icons.favorite_border),
              onPressed: () => wl.toggle(p),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(p.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Row(children: [
            Text(formatPrice(p.effectivePrice), style: Theme.of(context).textTheme.titleMedium),
            if (p.salePrice != null) ...[
              const SizedBox(width: 10),
              Text(formatPrice(p.price), style: const TextStyle(decoration: TextDecoration.lineThrough))
            ]
          ]),
          const SizedBox(height: 12),
          if (p.sizes.isNotEmpty)
            Wrap(
              spacing: 8,
              children: p.sizes.map((s) => ChoiceChip(
                label: Text(s),
                selected: _size == s,
                onSelected: (_) => setState(() => _size = s),
              )).toList(),
            ),
          if (p.colors.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: p.colors.map((c) => ChoiceChip(
                label: Text(c),
                selected: _color == c,
                onSelected: (_) => setState(() => _color = c),
              )).toList(),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(onPressed: () => setState(() => _qty = (_qty - 1).clamp(1, 99)), icon: const Icon(Icons.remove)),
              Text('Qty: $_qty'),
              IconButton(onPressed: () => setState(() => _qty = (_qty + 1).clamp(1, 99)), icon: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              if (p.stock <= 0) return;
              context.read<CartState>().add(p, size: _size, color: _color, qty: _qty);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
