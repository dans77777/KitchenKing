import 'package:KitchenKing/models/category.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_items.dart';

class CatMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routesArg['title'];
    final String id = routesArg['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
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
