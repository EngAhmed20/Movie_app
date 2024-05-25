import 'package:flutter/material.dart';
import 'package:movie_clean/core/utils/app_string.dart';
import 'package:movie_clean/core/utils/service_locator.dart';
import 'package:movie_clean/movie/presentaion/screens/movie_scr.dart';

void main() {
  ServicesLoacator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home:  MovieScr(),
      debugShowCheckedModeBanner: false,
    );
  }
}


