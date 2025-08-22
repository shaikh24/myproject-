import 'package:flutter/foundation.dart';
import '../models/product.dart';

class WishlistState extends ChangeNotifier {
  final Map<String, Product> _map = {};
  Map<String, Product> get items => _map;

  void toggle(Product p) {
    if (_map.containsKey(p.id)) {
      _map.remove(p.id);
    } else {
      _map[p.id] = p;
    }
    notifyListeners();
  }

  bool contains(String id) => _map.containsKey(id);
}
