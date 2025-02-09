import 'package:flutter/material.dart';

class GenresCell extends StatelessWidget {
  final Map bObj;
  final Color bgColor;
  const GenresCell({super.key, required this.bObj, required this.bgColor,});

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
        width: media.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image.asset(
                  bObj["img"].toString(),
                  width: media.width * 0.7,
                  height: media.width * 0.35,
                  fit: BoxFit.contain,
                ),
            const SizedBox(
              height: 15,
            ),
            Text(
              bObj["name"].toString(),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}