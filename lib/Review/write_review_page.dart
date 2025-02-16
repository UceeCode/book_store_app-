import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  _WriteReviewPageState createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  int _rating = 0;
  final _reviewController = TextEditingController();
  List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  // Load reviews from SharedPreferences
  Future<void> _loadReviews() async {
    final prefs = await SharedPreferences.getInstance();
    final String? reviewsString = prefs.getString('reviews');
    if (reviewsString != null) {
      setState(() {
        _reviews = List<Map<String, dynamic>>.from(
          jsonDecode(reviewsString),
        );
      });
    }
  }

  // Save reviews to SharedPreferences
  Future<void> _saveReviews() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('reviews', jsonEncode(_reviews));
  }

  // Submit a review
  void _submitReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'rating': _rating,
          'reviewText': _reviewController.text,
          'likes': 0,
        });
        _reviewController.clear();
        _rating = 0;
      });
      _saveReviews();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a review')),
      );
    }
  }

  // Like a review
  void _likeReview(int index) {
    setState(() {
      _reviews[index]['likes'] += 1;
    });
    _saveReviews();
  }

  // Delete a review
  void _deleteReview(int index) {
    setState(() {
      _reviews.removeAt(index);
    });
    _saveReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write a Review'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating:'),
            Slider(
              value: _rating.toDouble(),
              min: 0,
              max: 5,
              divisions: 5,
              label: '$_rating stars',
              onChanged: (value) {
                setState(() {
                  _rating = value.toInt();
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Review:'),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your review here',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _submitReview,
                child: const Text('Submit Review'),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'All Reviews:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (_reviews.isEmpty)
              const Text('No reviews yet. Be the first to write one!'),
            ..._reviews.asMap().entries.map((entry) {
              final index = entry.key;
              final review = entry.value;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text('Rating: ${review['rating']} stars'),
                  subtitle: Text(review['reviewText']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () => _likeReview(index),
                      ),
                      Text('${review['likes']}'),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteReview(index),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
