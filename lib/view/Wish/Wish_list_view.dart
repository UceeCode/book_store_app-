import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/Wish_list_item.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key, required List initialItems}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late List<WishlistItem> wishlistItems;

  @override
  void initState() {
    super.initState();
    wishlistItems = [
      WishlistItem(name: 'Atomic Habits', author: 'James Clear', imageUrl: 'assets/img/AtomicHabit.png', rating: 4.8),
      WishlistItem(name: 'The Alchemist', author: 'Paulo Coelho', imageUrl: 'assets/img/TheAlchemist.webp', rating: 4.7),
      WishlistItem(name: 'Circe', author: 'Madeline Miller', imageUrl: 'assets/img/Circe.jpg', rating: 4.9),
      WishlistItem(name: 'The Night Circus', author: 'Erin Morgenstern', imageUrl: 'assets/img/TheNightCircus.jpg', rating: 4.4),
      WishlistItem(name: 'Sapiens: A Brief History of Humankind', author: 'Benedict Wells', imageUrl: 'assets/img/sapiens.jpg', rating: 4.6),
      WishlistItem(name: 'Project Hail Mary', author: 'Andy Weir', imageUrl: 'assets/img/ProjectHailMary.jpg', rating: 4.9),
      WishlistItem(name: 'The Power Of Now', author: 'Eckhart Tolle', imageUrl: 'assets/img/ThePowerOfNow.jpg', rating: 5.2),
      WishlistItem(name: 'Deep Work', author: 'Cal Newport', imageUrl: 'assets/img/DeepWork.jpg', rating: 5.5),
      WishlistItem(name: '1984', author: 'George Orwell', imageUrl: 'assets/img/1984.jpg', rating: 7.5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Wishlist'),
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: wishlistItems.isEmpty
          ? Center(child: Text('No books in your wishlist.'))
          : ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item.author),
              leading: Image.asset(item.imageUrl, width: 90, height: 90, fit: BoxFit.contain),
              trailing: Icon(Icons.star, color: Colors.yellow),
            ),
          );
        },
      ),
    );
  }
}
