import 'package:flutter/material.dart';
import 'package:globime/pages/home.dart';
import 'package:globime/pages/loading.dart';
import 'package:globime/pages/location.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
      routes: {
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          surface: Colors.yellow,
          onSurface: Colors.black,
          // Colors that are not relevant to AppBar in DARK mode:
          primary: Colors.grey,
          onPrimary: Colors.grey,
          primaryVariant: Colors.grey,
          secondary: Colors.grey,
          secondaryVariant: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,
          onBackground: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
        ),
      ),
    );
  }
}
