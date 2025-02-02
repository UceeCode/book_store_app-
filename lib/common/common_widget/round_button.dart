import 'package:flutter/material.dart';

import '../color_extenstion.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: TColor.primary,
      height: 50,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class RoundLineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundLineButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: getColor(Colors.white, TColor.primary),
        foregroundColor: getColor(TColor.primary, Colors.white),
        shadowColor: WidgetStateProperty.all(TColor.primary),
        minimumSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        elevation:  WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed)? 1 : 0),
        shape: WidgetStateProperty.resolveWith((states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 1,
            color: states.contains(WidgetState.pressed) ? Colors.transparent: TColor.primary,
          ),
        )),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  WidgetStateProperty<Color?> getColor(Color color, Color colorPressed) {
    return WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.pressed) ? colorPressed : color,
    );
  }
}
