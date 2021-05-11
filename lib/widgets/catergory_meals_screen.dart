import 'package:flutter/material.dart';

class CatMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routesArg['title'];
    final String id = routesArg['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
