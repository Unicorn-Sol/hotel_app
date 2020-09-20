import 'package:flutter/material.dart';
import 'package:hotel_app/dummy_data.dart';
import 'package:hotel_app/models/meal.dart';
import 'package:hotel_app/screens/filters_screen.dart';
import 'package:hotel_app/screens/tabs_screen.dart';

class MainDrawer extends StatefulWidget {


  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme
                .of(context)
                .accentColor,
            // decoration: BoxDecoration(),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme
                      .of(context)
                      .primaryColor),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 20,),
          ListTile(leading: Icon(Icons.restaurant, size: 26,),
            title: Text('Meals'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(leading: Icon(Icons.settings, size: 26,),
            title: Text('Settings'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          )

        ],
      ),
    );
  }
}
