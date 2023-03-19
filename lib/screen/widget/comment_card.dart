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
    
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                commenterName ?? '',
                style: heading2,
              ),
              PopupMenuButton(
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'laporkan',
                    child: Text(delegate.b_laporkanPenilaian),
                  ),
                ],
                onSelected: (value) {
                  logger.d('Pengguna menekan butang laporkan');
                },
              )
            ],
          ),
          Text(rating.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(menuName!), Text(price.toString())],
          ),
          Text(review ?? ''),
          const Divider(),
        ],
      ),
    );
  }
}
