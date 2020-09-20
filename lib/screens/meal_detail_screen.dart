import 'package:flutter/material.dart';
import 'package:hotel_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  final Function toggleFavorite;
  final Function isFavorite;
  static const routeName = '/meal-detail';

  MealDetailScreen(this.toggleFavorite,this.isFavorite);
  Widget listContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( isFavorite(mealId) ?Icons.star : Icons.star_border),
        onPressed: (){
          toggleFavorite(mealId);
        },
      ),
      appBar: AppBar(title: Text(selectedMeal.title),),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Ingredients', style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
              ),
              listContainer(ListView.builder(
                itemBuilder: (context, index) =>
                    Card(
                      color: Theme
                          .of(context)
                          .accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                itemCount: selectedMeal.ingredients.length,
              ),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Steps', style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
              ),
              listContainer(ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${index+1}'),),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                );

              },
                itemCount: selectedMeal.steps.length,
              ))

            ],
          ),
        ),
      ),
    );
  }
}
