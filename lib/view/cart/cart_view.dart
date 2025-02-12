import 'package:flutter/material.dart';
import '../../models/books.dart';

class CartView extends StatelessWidget {
  final List<Book> cart;

  CartView({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.blue,
      ),
      body: cart.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                var book = cart[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(book.img),
                    title: Text(book.name),
                    subtitle: Text("by ${book.author}"),
                    trailing: Text("\$${book.price}"),
                  ),
                );
              },
            ),
    );
  }
}
