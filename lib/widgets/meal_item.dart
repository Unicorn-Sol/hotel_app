import 'package:flutter/material.dart';
import 'package:hotel_app/models/meal.dart';
import 'package:hotel_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
        @required this.id});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(imageUrl, height: 250, width: double.infinity,fit: BoxFit.cover,)),
                Positioned(
                  right: 0,
                  bottom: 20,
                  child: Container(
                    width: 222,
                    padding: EdgeInsets.only(left: 5),

                    color: Colors.black54,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 26,color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.schedule,),
                        SizedBox(width: 6,),
                        Text('$duration min'),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.work,),
                        SizedBox(width: 6,),
                        Text('${complexity.toString().substring(complexity.toString().indexOf('.') + 1)} '),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.attach_money,),
                        SizedBox(width: 6,),
                        Text('${affordability.toString().substring(affordability.toString().indexOf('.') + 1)} '),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
