import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ImageCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
                stops: [0.7, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
