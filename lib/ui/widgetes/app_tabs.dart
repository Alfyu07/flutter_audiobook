import 'package:flutter/material.dart';
import 'package:ebooks_app/shared/app_textstyle.dart' as textstyle;
import 'package:ebooks_app/shared/app_colors.dart' as app_colors;

class AppTabs extends StatelessWidget {
  final Color color;
  final String title;
  const AppTabs({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 50,
      child: Text(
        title,
        style: textstyle.medium.copyWith(color: Colors.white, fontSize: 18),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 0),
          )
        ],
      ),
    );
  }
}
