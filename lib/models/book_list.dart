import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  final List<Map<String, String>> books;

  const BookListView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Titles")),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book['name'] ?? 'No Title'),
          );
        },
      ),
    );
  }
}

void main() {
  List<Map<String, String>> bestArr = [
    {"name": "The Forgotten Guardians", "author": "Daniel Taylor", "img": "assets/img/TheForgottenGuardians.jpg"},
    {"name": "The End of Loneliness", "author": "Benedict Wells", "img": "assets/img/TheEndOfLoneliness.webp"},
    {"name": "No More Lies", "author": "Kerry Lonsdale", "img": "assets/img/NoMoreLies.jpg"},
    {"name": "Atomic Habit", "author": "James Clear", "img": "assets/img/AtomicHabit.png"},
    {"name": "The Night Circus", "author": "Erin Morgenstern", "img": "assets/img/TheNightCircus.jpg"},
    {"name": "Project Hail Mary", "author": "Andy Weir", "img": "assets/img/ProjectHailMary.jpg"},
    {"name": "The Alchemist", "author": "Paulo Coelho", "img": "assets/img/TheAlchemist.webp"},
    {"name": "Sapiens: A Brief History of Humankind", "author": "Yuval Noah Harari", "img":"assets/img/sapiens.jpg"},
    {"name": "The Name of the Wind", "author": "Patrick Rothfuss", "img": "assets/img/TheNameOfTheWind.jpg"},
    {"name": "The Power Of Now", "author": "Eckhart Tolle", "img": "assets/img/ThePowerOfNow.jpg"},
    {"name": "Deep Work", "author": "Cal Newport", "img": "assets/img/DeepWork.jpg"},
    {"name": "Circe", "author": "Madeline Miller", "img": "assets/img/Circe.jpg"},
  ];

  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    home: BookListView(books: bestArr),
  ));
}
