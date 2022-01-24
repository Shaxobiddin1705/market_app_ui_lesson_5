import 'package:flutter/material.dart';
import 'package:market_app_ui_lesson_5/pages/details_page.dart';
import 'package:market_app_ui_lesson_5/pages/home_page.dart';
import 'package:market_app_ui_lesson_5/pages/online_task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnlineTaskPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        DetailsPage.id: (context) => const DetailsPage(),
        OnlineTaskPage.id: (context) => const OnlineTaskPage(),
      },
    );
  }
}