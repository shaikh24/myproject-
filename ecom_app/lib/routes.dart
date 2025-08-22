import 'package:flutter/material.dart';
import 'ui/pages/cart_page.dart';
import 'ui/pages/categories_page.dart';
import 'ui/pages/checkout_page.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/orders_page.dart';
import 'ui/pages/product_detail_page.dart';
import 'ui/pages/product_list_page.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/subcategories_page.dart';
import 'ui/pages/support_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/categories':
      return MaterialPageRoute(builder: (_) => const CategoriesPage());
    case '/subcategories':
      final categoryId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => SubcategoriesPage(categoryId: categoryId));
    case '/product_list':
      final subcategoryId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => ProductListPage(subcategoryId: subcategoryId));
    case '/product':
      final productId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) => ProductDetailPage(productId: productId));
    case '/cart':
      return MaterialPageRoute(builder: (_) => const CartPage());
    case '/checkout':
      return MaterialPageRoute(builder: (_) => const CheckoutPage());
    case '/orders':
      return MaterialPageRoute(builder: (_) => const OrdersPage());
    case '/profile':
      return MaterialPageRoute(builder: (_) => const ProfilePage());
    case '/support':
      return MaterialPageRoute(builder: (_) => const SupportPage());
    default:
      return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
