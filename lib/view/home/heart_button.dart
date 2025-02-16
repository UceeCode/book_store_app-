import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool('isFavorite') ?? false;
    });
  }

  void _saveFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFavorite', isFavorite);
  }

  // Show confirmation dialog before removing favorite
  Future<void> _confirmUnfavorite() async {
    bool? shouldUnfavorite = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Remove Favorite"),
        content: Text("Are you sure you want to remove from favorites?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Remove"),
          ),
        ],
      ),
    );

    if (shouldUnfavorite == true) {
      setState(() {
        isFavorite = false;
      });
      _saveFavoriteStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.white,
      ),
      onPressed: () {
        if (isFavorite) {
          _confirmUnfavorite(); // Show confirmation before removing favorite
        } else {
          setState(() {
            isFavorite = true;
          });
          _saveFavoriteStatus();
        }
      },
    );
  }
}
