import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartView extends StatelessWidget {
  // Provided list of prices
  final List<String> prices = ['19.99', '24.99', '15.99', '30.00', '22.50'];

  @override
  Widget build(BuildContext context) {
    var cartItems = Provider.of<CartProvider>(context).cartItems;

    // Assign prices from the provided list based on index
    for (int i = 0; i < cartItems.length; i++) {
      cartItems[i]['price'] = prices[i % prices.length];
    }

    // Calculate total price
    double totalPrice = cartItems.fold(0.0, (sum, item) {
      double price = double.tryParse(item['price'] ?? '0') ?? 0.0;
      int quantity = item['quantity'] ?? 1;
      return sum + (price * quantity);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        automaticallyImplyLeading: false, // Removes the back icon
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("No items in cart"))
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                double price = double.tryParse(item['price'] ?? '0') ?? 0.0;

                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Price: \$${price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text('Qty: ${item['quantity'] ?? 1}'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .incrementQuantity(item);
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .decrementQuantity(item);
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeFromCart(item);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
