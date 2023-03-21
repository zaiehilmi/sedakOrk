import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sedakork/screen/widget/rating_star.dart';
import 'package:sedakork/util/screen_constant.dart';
import 'package:sedakork/util/setting_constant.dart';

class CommentCard extends StatelessWidget {
  String? commenterName;
  String? cafeName;
  double rating;
  String? menuName;
  String? review;
  double? price;
  Screen implementation;

  var logger = Logger();

  CommentCard({
    super.key,
    this.commenterName,
    this.cafeName,
    required this.rating,
    required this.menuName,
    required this.implementation,
    this.price,
    this.review,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _textWidget(textTheme(context), colorScheme(context)),
              PopupMenuButton(
                offset: Offset.zero,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'laporkan',
                    child: Text(
                      delegate(context).b_laporkanPenilaian,
                      style: textTheme(context).labelMedium,
                    ),
                  ),
                ],
                onSelected: (value) {
                  logger.d('Pengguna menekan butang laporkan');
                },
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          RatingStar(
            value: rating,
            color: colorScheme(context).secondary,
            unratedColor: const Color.fromARGB(255, 209, 209, 209),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                menuName!,
                style:
                    textTheme(context).titleMedium!.copyWith(color: colorScheme(context).primary),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  color: colorScheme(context).tertiaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    'RM ${price?.toStringAsFixed(2)}',
                    style: textTheme(context).bodyMedium
                        ?.copyWith(color: colorScheme(context).onTertiaryContainer),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            review ?? '',
            style:
                textTheme(context).bodySmall?.copyWith(color: colorScheme(context).onBackground),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _textWidget(TextTheme textTheme, ColorScheme colorTheme) {
    switch (implementation) {
      case Screen.search:
        return Text(
          commenterName!,
          style: textTheme.bodySmall?.copyWith(
            color: colorTheme.onBackground,
            fontWeight: FontWeight.w300,
          ),
        );
      case Screen.history:
        return Text(
          cafeName!,
          style: textTheme.bodySmall?.copyWith(
            color: colorTheme.onBackground,
            fontWeight: FontWeight.w300,
          ),
        );
    }
  }
}
