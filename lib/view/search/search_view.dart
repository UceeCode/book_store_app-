import 'package:flutter/material.dart';
import '../our_book/out_books_view.dart'; // Corrected import

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();

  // Updated 'topPickArr' with price, popularity, and releaseDate
  List<Map<String, dynamic>> topPickArr = [
    {
      "name": "The Forgotten Guardians",
      "author": "Daniel Taylor",
      "img": "assets/img/TheForgottenGuardians.jpg",
      "price": 12.99,
      "popularity": 4.8,
      "releaseDate": DateTime(2020, 5, 15),
    },
    {
      "name": "The End of Loneliness",
      "author": "Benedict Wells",
      "img": "assets/img/TheEndOfLoneliness.webp",
      "price": 9.99,
      "popularity": 4.5,
      "releaseDate": DateTime(2016, 7, 10),
    },
    {
      "name": "No More Lies",
      "author": "Kerry Lonsdale",
      "img": "assets/img/NoMoreLies.jpg",
      "price": 10.99,
      "popularity": 4.7,
      "releaseDate": DateTime(2021, 8, 3),
    },
    {
      "name": "Sapiens: A Brief History of Humankind",
      "author": "Benedict Wells",
      "img": "assets/img/sapiens.jpg",
      "price": 9.99,
      "popularity": 4.5,
      "releaseDate": DateTime(2016, 7, 10),
    },
    {
      "name": "Atomic Habit",
      "author": "James Clear",
      "img": "assets/img/AtomicHabit.png",
      "price": 5.99,
      "popularity": 5.5,
      "releaseDate": DateTime(2015, 3, 10),
    },
    {
      "name": "The Night Circus",
      "author": "Erin Morgenstern",
      "img": "assets/img/TheNightCircus.jpg",
      "price": 11.99,
      "popularity": 4.5,
      "releaseDate": DateTime(2017, 6, 11),
    },
    {
      "name": "Project Hail Mary",
      "author": "Andy Weir",
      "img": "assets/img/ProjectHailMary.jpg",
      "price": 9.99,
      "popularity": 4.5,
      "releaseDate": DateTime(2019, 7, 10),
    },
    {
      "name": "The Alchemist",
      "author": "Paulo Coelho",
      "img": "assets/img/TheAlchemist.webp",
      "price": 9.99,
      "popularity": 4.5,
      "releaseDate": DateTime(2016, 7, 10),
    },
  ];

  List<Map<String, dynamic>> filteredBooks = [];
  String selectedFilter = 'None';

  @override
  void initState() {
    super.initState();
    filteredBooks = List.from(topPickArr);
  }

  void filterBooks(String query) {
    setState(() {
      filteredBooks = topPickArr.where((book) {
        return book['name'].toLowerCase().contains(query.toLowerCase()) ||
            book['author'].toLowerCase().contains(query.toLowerCase());
      }).toList();
      applySorting();
    });
  }

  void applySorting() {
    setState(() {
      if (selectedFilter == 'Price') {
        filteredBooks.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (selectedFilter == 'Popularity') {
        filteredBooks.sort((a, b) => b['popularity'].compareTo(a['popularity']));
      } else if (selectedFilter == 'Release Date') {
        filteredBooks.sort((a, b) => b['releaseDate'].compareTo(a['releaseDate']));
      } else if (selectedFilter == 'Name') {
        filteredBooks.sort((a, b) => a['name'].compareTo(b['name']));
      }
    });
  }

  void navigateToBookDetail(Map<String, dynamic> book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OurBooksView(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Books'),
        automaticallyImplyLeading: false, // Removes the back icon
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              onChanged: filterBooks,
              decoration: InputDecoration(
                hintText: 'Search by title or author',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Dropdown for sorting options aligned to the left
            Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                value: selectedFilter,
                items: ['None', 'Name', 'Price', 'Popularity', 'Release Date']
                    .map((filter) => DropdownMenuItem(
                  child: Text(filter),
                  value: filter,
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value!;
                    applySorting();
                  });
                },
              ),
            ),
            SizedBox(height: 10),

            // ListView for displaying filtered and sorted books
            Expanded(
              child: ListView.builder(
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  var book = filteredBooks[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(book['img'], width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(book['name']),
                      subtitle: Text('${book['author']}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$${book['price']}'),
                          Text('Rating: ${book['popularity']}'),
                        ],
                      ),
                      onTap: () => navigateToBookDetail(book),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}