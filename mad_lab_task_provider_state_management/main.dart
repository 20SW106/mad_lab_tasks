import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/home_screen.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
import 'package:provider_tutorials/provider/example_one_provider.dart';
import 'package:provider_tutorials/screen/count_example.dart';
import 'package:provider_tutorials/screen/example_one.dart';
import 'package:provider_tutorials/why_provider.dart';
import 'stateful_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
      ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ExampleOneScreen(),
        ));
  }
}
