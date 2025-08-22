import 'cart_item.dart';
import 'address.dart';

class OrderModel {
  final String id;
  final List<CartItem> items;
  final int subtotal;
  final int discount;
  final int deliveryFee;
  final int tax;
  final int total;
  final String status;
  final Address? address;

  OrderModel({
    required this.id,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.deliveryFee,
    required this.tax,
    required this.total,
    required this.status,
    this.address,
  });
}
