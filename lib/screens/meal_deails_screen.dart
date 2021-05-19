import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  final Function toggleMeal;
  final Function isFav;
  MealDetails(this.isFav, this.toggleMeal);
  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Widget _buildTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _builContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.all(6),
        height: 150,
        width: 320,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
          ),
          _buildTitle(context, 'Ingredients'),
          _builContainer(
            ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          _buildTitle(context, 'Steps'),
          _builContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              itemCount: selectedMeal.steps.length,
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleMeal(mealId),
      ),
    );
  }
}
