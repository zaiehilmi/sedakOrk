import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/screen/widget/rating_star.dart';

class CommentCard extends StatelessWidget {
  String? commenterName;
  double rating;
  String? menuName;
  String? review;
  double? price;

  var logger = Logger();

  CommentCard({
    super.key,
    this.commenterName,
    required this.rating,
    required this.menuName,
    this.price,
    this.review,
  });

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                commenterName ?? '',
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onBackground,
                  fontWeight: FontWeight.w300,
                ),
              ),
              PopupMenuButton(
                offset: Offset.zero,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'laporkan',
                    child: Text(
                      delegate.b_laporkanPenilaian,
                      style: textTheme.labelMedium,
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
            color: colorTheme.secondary,
            unratedColor: const Color.fromARGB(255, 209, 209, 209),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                menuName!,
                style:
                    textTheme.titleMedium!.copyWith(color: colorTheme.primary),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  color: colorTheme.tertiaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    'RM ${price?.toStringAsFixed(2)}',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colorTheme.onTertiaryContainer),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            review ?? '',
            style:
                textTheme.bodySmall?.copyWith(color: colorTheme.onBackground),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
