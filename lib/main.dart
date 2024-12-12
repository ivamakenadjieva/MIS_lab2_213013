import 'package:flutter/material.dart';
import 'package:new_flutter_project/screens/jokes_by_type.dart';
import 'package:new_flutter_project/screens/home.dart';
import 'package:new_flutter_project/screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '213013',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) => JokesByType(type: ModalRoute.of(context)!.settings.arguments as String),
        '/random': (context) => const RandomJoke(),
      },
    );
  }
}


