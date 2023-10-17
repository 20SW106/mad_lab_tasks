import 'package:flutter/material.dart';
import 'package:untitled1/home_screen.dart';
import 'package:untitled1/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
        // useMaterial3: true,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        ScreenTwo.id : (context) => ScreenTwo()
      },
      home: HomeScreen(),
    );
  }
}

