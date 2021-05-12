import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Text('$mealId'),
    );
  }
}
