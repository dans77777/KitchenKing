import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/catergory_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kitchen King',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(title: TextStyle(fontSize: 20))),
      home: CategoryScreen(),
      routes: {'/catMeals': (ctx) => CatMeals()},
    );
  }
}
