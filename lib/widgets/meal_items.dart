import 'package:KitchenKing/models/meals.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability});
  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/mealDetail', arguments: id);
  }

  String get complexitys {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Not available';
    }
  }

  String get affordable {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;

      case Affordability.Pricey:
        return 'expensive';
        break;
      case Affordability.Luxurious:
        return 'very expensive';
        break;
      default:
        return 'Not available';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black54),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      width: 300,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexitys)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordable),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
