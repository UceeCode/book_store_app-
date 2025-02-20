import 'package:book_store_app/common/common_widget/genres_cell.dart';
import 'package:book_store_app/models/cart_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/color_extenstion.dart';
import '../../common/common_widget/best_seller_cell.dart';
import '../../common/common_widget/recent_cell.dart';
import '../../common/common_widget/round_button.dart';
import '../../common/common_widget/round_textfield.dart';
import '../../common/common_widget/top_picks_cell.dart';
import '../../login/sign_up_view.dart';
import '../../providers/cart_provider.dart';
import '../main_tab/main_tab_view.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPickArr = [
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

  List bestArr = [
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

  List genreArr = [
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

  List recentArr = [
    {"name": "Circe", "author": "Madeline Miller", "img": "assets/img/Circe.jpg"},
    {"name": "Educated", "author": "Tara Westover", "img": "assets/img/Educated.jpg"},
    {"name": "Becoming", "author": "Michelle Obama", "img": "assets/img/Becoming.jpg"},
    {"name": "Dune", "author": "Frank Herbert", "img": "assets/img/Dune.webp"},
    {"name": "The Catcher in the Rye", "author": "J.D. Salinger", "img": "assets/img/TheCatcherInTheRye.jpg"},
    {"name": "1984", "author": "George Orwell", "img": "assets/img/1984.jpg"},
    {"name": "The Great Gatsby", "author": "F. Scott Fitzgerald", "img": "assets/img/TheGreateGatsby.jpg"},
    {"name": "The Hobbit", "author": "J.R.R. Tolkien", "img": "assets/img/TheHobbit.jpg"},
    {"name": "Pride and Prejudice", "author": "Jane Austen", "img": "assets/img/PrideAndPrejudice.jpg"},
    {"name": "To Kill a Mockingbird", "author": "Harper Lee", "img": "assets/img/ToKillAMockingbird.webp"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(media.width * 0.5),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width * 0.1),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(children: const [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(onPressed: () {
                          sideMenuScaffoldKey.currentState?.openEndDrawer();
                        }, icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPickArr.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          var iObj = topPickArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(iObj: iObj);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            _buildSectionTitle("Bestsellers"),
            SizedBox(
              height: media.width * 0.9,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: bestArr.length,
                itemBuilder: (context, index) {
                  var bObj = bestArr[index] as Map? ?? {};
                  List<String> prices = ['19.99', '24.99', '15.99', '30.00', '22.50'];
                  var price = prices[index % prices.length];
                  return GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        BestSellerCell(
                          bObj: bObj,
                          price: price,
                        ),
                        Positioned(
                          top: 10,
                          right: 15,  // Shift the icon to the right
                          child: Container(
                            width: 30,  // Size of the circle
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,  // White background
                              shape: BoxShape.circle,  // Circular shape
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: IconButton(
                                iconSize: 18,  // Smaller icon size
                                icon: Icon(Icons.add_shopping_cart, color: TColor.primary),
                                onPressed: () {
                                  Provider.of<CartProvider>(context, listen: false).addToCart({
                                    'name': bObj['name'], // Correct key!
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added to cart!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },

                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 15, // Place heart button next to cart button
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: HeartButton(
                                // bookData: topPickArr[0], // Pass the first item of the array (or any item you'd like)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            _buildSectionTitle("Genres"),
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: genreArr.length,
                itemBuilder: (context, index) {
                  var bObj = genreArr[index] as Map? ?? {};
                  return Stack(
                    children: [
                      GenresCell(bObj: bObj, bgColor: index % 2 == 0 ? TColor.color1 : TColor.color2),
                      Positioned(
                        top: 10,
                        right: 15,  // Shift the icon to the right
                        child: Container(
                          width: 30,  // Size of the circle
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,  // White background
                            shape: BoxShape.circle,  // Circular shape
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Shadow position
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              iconSize: 18,  // Smaller icon size
                              icon: Icon(Icons.add_shopping_cart, color: TColor.primary),
                              onPressed: () {
                                Provider.of<CartProvider>(context, listen: false).addToCart({
                                  'name': bObj['name'],
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added to cart!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )

                    ],
                  );
                },
              ),
            ),
            SizedBox(height: media.width * 0.1),
            _buildSectionTitle("New Arrivals"),
            SizedBox(
              height: media.width * 0.7,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr[index] as Map? ?? {};
                  return Stack(
                    children: [
                      RecentCell(iObj: bObj),
                      Positioned(
                        top: 10,
                        right: 15,  // Shift the icon to the right
                        child: Container(
                          width: 30,  // Size of the circle
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,  // White background
                            shape: BoxShape.circle,  // Circular shape
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Shadow position
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                              iconSize: 18,  // Smaller icon size
                              icon: Icon(Icons.add_shopping_cart, color: TColor.primary),
                              onPressed: () {
                                Provider.of<CartProvider>(context, listen: false).addToCart({
                                  'name': bObj['name'],
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added to cart!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )

                    ],
                  );
                },
              ),
            ),
            SizedBox(height: media.width * 0.1),
            _buildSectionTitle("Monthly Newsletter"),
            _buildNewsletterForm(media),
            SizedBox(height: media.width * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
            color: TColor.text, fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildNewsletterForm(Size media) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(color: TColor.textbox.withOpacity(0.4), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 12,
              )),
          const SizedBox(height: 15),
          RoundTextField(controller: txtName, hintText: "Name"),
          const SizedBox(height: 15),
          RoundTextField(controller: txtEmail, hintText: "Email Address"),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MiniRoundButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.white,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle heart on/off
        });
      },
    );
  }
}