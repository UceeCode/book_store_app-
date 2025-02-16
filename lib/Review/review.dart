// import 'package:book_store_app/Review/write_review_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../models/review.dart';
//
// class ReviewPage extends StatefulWidget {
//   final String bookId;
//
//   const ReviewPage({Key? key, required this.bookId}) : super(key: key);
//
//   @override
//   _ReviewPageState createState() => _ReviewPageState();
// }
//
// class _ReviewPageState extends State<ReviewPage> {
//   List<Review> reviews = [];
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadReviews();
//   }
//
//   Future<void> _loadReviews() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       reviews = await fetchReviews(widget.bookId);
//     } catch (e) {
//       print("Error loading reviews: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error loading reviews')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   Future<List<Review>> fetchReviews(String bookId) async {
//     final url = Uri.parse('YOUR_API_ENDPOINT/reviews?bookId=$bookId'); // Replace with your API endpoint
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body) as List<dynamic>;
//       return jsonData.map((reviewData) => Review.fromJson(reviewData)).toList();
//     } else {
//       throw Exception('Failed to load reviews');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reviews'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : reviews.isEmpty
//           ? const Center(child: Text('No reviews yet.'))
//           : ListView.builder(
//         itemCount: reviews.length,
//         itemBuilder: (context, index) {
//           final review = reviews[index];
//           return Card(
//             child: ListTile(
//               leading: const CircleAvatar(
//                 child: Icon(Icons.person),
//               ),
//               title: Row(
//                 children: [
//                   RatingBar.builder(
//                     initialRating: review.rating.toDouble(),
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     itemCount: 5,
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     itemBuilder: (context, _) => const Icon(
//                       Icons.star,
//                       color: Colors.amber,
//                     ),
//                     onRatingUpdate: (rating) {
//                       // Do nothing here (prevent rating updates on this page)
//                     },
//                   ),
//                 ],
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(review.reviewText),
//                   // Like button and count (add API call for liking)
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.thumb_up),
//                         onPressed: () {
//                           _likeReview(review.id);
//                         },
//                       ),
//                       Text('${review.likes}'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => WriteReviewPage(bookId: widget.bookId),
//             ),
//           ).then((newReview) {
//             if (newReview != null) {
//               _loadReviews(); // Refresh reviews after adding
//             }
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//
//   Future<void> _likeReview(String reviewId) async {
//     final url = Uri.parse('YOUR_API_ENDPOINT/reviews/$reviewId/like'); // Replace with your API endpoint
//     final response = await http.post(url); // Or put if you prefer
//
//     if (response.statusCode == 200) {
//       _loadReviews();
//     } else {
//       print('Failed to like review');
//     }
//   }
// }
