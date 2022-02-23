import 'package:flutter/material.dart';
import '../../shared/app_colors.dart' as app_colors;
import '../../shared/app_textstyle.dart' as textstyle;

class ListItem extends StatelessWidget {
  final String imgUrl;
  final String rate;
  final String title;
  final String author;
  final String tag;

  const ListItem(
      {Key? key,
      required this.imgUrl,
      required this.rate,
      required this.title,
      required this.author,
      required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 0),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              imgUrl,
              width: 90,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: app_colors.starColor,
                    ),
                    Text(
                      rate,
                      style: textstyle.bold.copyWith(
                        color: app_colors.starColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 240,
                  child: Text(
                    title,
                    style: textstyle.bold.copyWith(fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: textstyle.medium.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: app_colors.loveColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: 24,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    tag,
                    style: textstyle.medium
                        .copyWith(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
