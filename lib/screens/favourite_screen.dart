import 'package:KitchenKing/models/meals.dart';
import 'package:KitchenKing/widgets/meal_items.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favourit;
  FavouriteScreen(this.favourit);
  @override
  Widget build(BuildContext context) {
    if (favourit.isEmpty) {
      return Container(
        child: Text('No Favourits..!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favourit[index].id,
            title: favourit[index].title,
            imageUrl: favourit[index].imageUrl,
            duration: favourit[index].duration,
            complexity: favourit[index].complexity,
            affordability: favourit[index].affordability,
          );
        },
        itemCount: favourit.length,
      );
    }
  }
}
