import 'package:flutter/material.dart';

import '../../models/Wish_list_item.dart';


class WishlistPage extends StatelessWidget {
  final List<WishlistItem> wishlistItems;

  WishlistPage({required this.wishlistItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Wishlist')),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return ListTile(
            title: Text(item.name),
            leading: Image.network(item.imageUrl),
          );
        },
      ),
    );
  }
}
