class WishlistItem {
  final String productId;
  final String name;
  final String imageUrl;

  WishlistItem({required this.productId, required this.name, required this.imageUrl});
}

List<WishlistItem> wishlistItems = []; // List to store wishlist items
