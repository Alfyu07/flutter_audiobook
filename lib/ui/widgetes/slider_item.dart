import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String imgUrl;
  const SliderItem({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 180,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
      ),
    );
  }
}
