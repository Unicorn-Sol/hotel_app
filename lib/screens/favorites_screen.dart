import 'package:flutter/material.dart';
import 'package:hotel_app/models/meal.dart';
import 'package:hotel_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {


  List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);
  @override
  Widget build(BuildContext context) {

    if(_favoriteMeals.isEmpty){
      return Center( child: Text("You have no Favorites yet- go ahead and add some"));
    }else{
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: _favoriteMeals[index].id,
          title: _favoriteMeals[index].title,
          imageUrl: _favoriteMeals[index].imageUrl,
          duration: _favoriteMeals[index].duration,
          affordability: _favoriteMeals[index].affordability,
          complexity: _favoriteMeals[index].complexity,
        );
      },
      itemCount: _favoriteMeals.length,
    );
  }
  }
}
