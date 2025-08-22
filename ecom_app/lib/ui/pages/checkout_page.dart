import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/cart_state.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Payment Method'),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.money),
              title: Text('Cash on Delivery'),
              trailing: Icon(Icons.check_circle),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                cart.clear();
                Navigator.popUntil(context, ModalRoute.withName('/home'));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed (mock)!')));
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
