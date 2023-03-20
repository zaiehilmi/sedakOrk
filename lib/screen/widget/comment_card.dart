import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:logger/logger.dart';
import 'package:sedakork/generated/l10n.dart';
import 'package:sedakork/util/custom_textstyle.dart';

class CommentCard extends StatelessWidget {
  String? commenterName;
  int? rating;
  String? menuName;
  String? review;
  double? price;

  var logger = Logger();
  var cts = CustomTextStyle(
    h3Color: const Color(0xff993955),
    h4Color: Color.fromARGB(255, 68, 68, 68),
  );

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
    // final colorTheme = Theme.of(context).

    return Container(
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
                style: textTheme.labelMedium,
                // style: cts.heading4,
              ),
              PopupMenuButton(
                offset: Offset.zero,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'laporkan',
                    child: Text(delegate.b_laporkanPenilaian),
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
          Text(rating.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                menuName!,
                style: textTheme.titleSmall!.copyWith(color: const Color(0xff993955)),
              ),
              Text(
                'RM ${price.toString()}',
                style: cts.text,
              ),
            ],
          ),
          Text(
            review ?? '',
            style: cts.text,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
