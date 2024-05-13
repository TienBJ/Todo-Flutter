import 'package:flutter/material.dart';

class ShowImageInternet extends StatelessWidget {
  const ShowImageInternet({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "Image Internet";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar:  AppBar(
          title: const Text(title),
        ),
        body: Image.network('https://4kwallpapers.com/images/wallpapers/tom-jerry-tv-series-3840x2160-12448.jpg'),
      ),
    );
  }
}