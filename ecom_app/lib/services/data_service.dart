import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/category.dart';
import '../models/subcategory.dart';
import '../models/product.dart';

class DataService {
  List<Category> categories = [];
  List<Subcategory> subcategories = [];
  List<Product> products = [];

  Future<void> load() async {
    final c = await rootBundle.loadString('assets/data/categories.json');
    final sc = await rootBundle.loadString('assets/data/subcategories.json');
    final p = await rootBundle.loadString('assets/data/products.json');
    categories = (json.decode(c) as List).map((e) => Category.fromJson(e)).toList();
    subcategories = (json.decode(sc) as List).map((e) => Subcategory.fromJson(e)).toList();
    products = (json.decode(p) as List).map((e) => Product.fromJson(e)).toList();
  }
}
