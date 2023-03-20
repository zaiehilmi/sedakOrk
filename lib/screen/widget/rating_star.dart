import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

class RatingStar extends StatelessWidget {
  Color color;
  Color unratedColor;
  double value;

  var logger = Logger();

  RatingStar({
    required this.color,
    required this.value,
    required this.unratedColor,
  });

  @override
  Widget build(BuildContext context) => RatingBarIndicator(
        itemCount: 5,
        rating: value,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: color,
        ),
        itemSize: 15,
        unratedColor: unratedColor,
      );
  // ratingWidget: RatingWidget(
  //   full: SvgPicture.asset(
  //     bintang,
  //     colorFilter: ColorFilter.mode(
  //       color,
  //       BlendMode.srcIn,
  //     ),
  //   ),
  //   half: SvgPicture.asset(
  //     bintangHalf,
  //     colorFilter: ColorFilter.mode(
  //       color,
  //       BlendMode.srcIn,
  //     ),
  //   ),
  //   empty: SvgPicture.asset(
  //     bintangOutline,
  //     colorFilter: ColorFilter.mode(
  //       color,
  //       BlendMode.srcIn,
  //     ),
  //   ),
  // ),
  // onRatingUpdate: (value) {
  //   logger.d('nilai penilaian $value');
  // });
}
