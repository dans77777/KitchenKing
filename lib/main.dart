import 'package:KitchenKing/dummy_data.dart';
import 'package:KitchenKing/screens/filters_screen.dart';
import 'package:flutter/material.dart';
import 'models/meals.dart';
import 'screens/catergory_meals_screen.dart';
import 'screens/meal_deails_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favorit = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleMeal(String mealId) {
    final existingIndex = favorit.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favorit.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favorit.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealfav(String mealId) {
    return favorit.any((meal) => meal.id == mealId);
  }

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
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favorit),
        '/catMeals': (ctx) => CatMeals(availableMeals),
        '/mealDetail': (ctx) => MealDetails(_isMealfav, toggleMeal),
        '/filters': (ctx) => FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
