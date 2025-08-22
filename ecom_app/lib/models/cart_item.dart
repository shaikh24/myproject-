import 'product.dart';

class CartItem {
  final Product product;
  final String? size;
  final String? color;
  int qty;
  CartItem({required this.product, this.size, this.color, this.qty = 1});

  String get key => '${product.id}_${size ?? ''}_${color ?? ''}';
  int get subtotal => product.effectivePrice * qty;
}
