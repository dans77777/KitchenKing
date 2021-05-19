import 'package:KitchenKing/models/meals.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_items.dart';

class CatMeals extends StatelessWidget {
  final List<Meal> availableMeals;
  CatMeals(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routesArg['title'];
    final String id = routesArg['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
