import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          _imagePath,
          height: size.height * .4,
          width: size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

const _imagePath = 'assets/images/flutter.jpg';
