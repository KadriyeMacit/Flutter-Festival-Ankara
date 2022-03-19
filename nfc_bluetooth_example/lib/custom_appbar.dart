import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
    String title, {
    Key? key,
  }) : super(
            key: key,
            backgroundColor: Colors.cyan,
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white));
}
