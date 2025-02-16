
class Review {
  final String id;
  final String userId;
  final int rating;
  final String reviewText;
  int likes;

  Review({
    required this.id,
    required this.userId,
    required this.rating,
    required this.reviewText,
    required this.likes,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['userId'],
      rating: json['rating'],
      reviewText: json['reviewText'],
      likes: json['likes'],
    );
  }
}