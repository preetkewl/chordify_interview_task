import 'package:chordify_interview_task/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  Routes() {
    initialize();
  }

  void initialize() async {
    runApp(MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => _handleCurrentScreen()),
      ],
    );
  }

  Widget _handleCurrentScreen() {
    return Home();
  }
}
