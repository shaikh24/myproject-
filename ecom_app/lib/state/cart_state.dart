import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartState extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  String? appliedCoupon;
  int deliveryFee = 250;
  int tax = 0;

  Map<String, CartItem> get items => _items;

  void add(Product p, {String? size, String? color, int qty = 1}) {
    final temp = CartItem(product: p, size: size, color: color, qty: qty);
    if (_items.containsKey(temp.key)) {
      _items[temp.key]!.qty += qty;
    } else {
      _items[temp.key] = temp;
    }
    notifyListeners();
  }

  void remove(String key) {
    _items.remove(key);
    notifyListeners();
  }

  void setQty(String key, int qty) {
    if (_items.containsKey(key)) {
      _items[key]!.qty = qty.clamp(1, 999);
      notifyListeners();
    }
  }

  int get subtotal => _items.values.fold(0, (s, it) => s + it.subtotal);
  int get discount {
    if (appliedCoupon == null) return 0;
    // Very simple 10% welcome coupon
    if (appliedCoupon == "WELCOME10") return (subtotal * 0.1).floor();
    return 0;
  }
  int get total => subtotal - discount + deliveryFee + tax;

  void clear() {
    _items.clear();
    appliedCoupon = null;
    notifyListeners();
  }
}
