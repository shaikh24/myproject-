import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/cart_state.dart';
import '../../ui/widgets/qty_stepper.dart';
import '../../utils/formatting.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>();
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: items.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : ListView(
              children: [
                ...items.map((it) => ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text(it.product.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${it.size ?? ''} ${it.color ?? ''}'.trim()),
                          Text(formatPrice(it.product.effectivePrice)),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          QtyStepper(
                            qty: it.qty,
                            onMinus: () => cart.setQty(it.key, (it.qty - 1)),
                            onPlus: () => cart.setQty(it.key, (it.qty + 1)),
                          ),
                          Text(formatPrice(it.subtotal)),
                        ],
                      ),
                      onLongPress: () => cart.remove(it.key),
                    )),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Coupon code (try WELCOME10)',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (v) {
                          cart.appliedCoupon = v.trim().isEmpty ? null : v.trim().toUpperCase();
                        },
                      ),
                      const SizedBox(height: 12),
                      Text('Subtotal: ${formatPrice(cart.subtotal)}'),
                      Text('Discount: -${formatPrice(cart.discount)}'),
                      Text('Delivery: ${formatPrice(cart.deliveryFee)}'),
                      Text('Tax: ${formatPrice(cart.tax)}'),
                      const SizedBox(height: 8),
                      Text('Total: ${formatPrice(cart.total)}', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/checkout'),
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
