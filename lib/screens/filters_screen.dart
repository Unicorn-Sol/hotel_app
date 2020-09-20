import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Map<String,bool> filters;
  final Function saveFilters;
  FiltersScreen(this.filters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree =false;
  var _vegetarian =false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
     _glutenFree = widget.filters['gluten'];
     _vegetarian = widget.filters['vegetarian'];
     _vegan = widget.filters['vegan'];
     _lactoseFree = widget.filters['lactose'];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Filter'),
          actions: [
            IconButton(icon: Icon(Icons.done,color: Colors.white,), onPressed: (){
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
            },)
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selections',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Gluten-Free'),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten free meals'),
                    onChanged: (bool value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (bool value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan,
                    subtitle: Text('Only include vegan meals'),
                    onChanged: (bool value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: _lactoseFree,
                    subtitle: Text('Only include lactose free meals'),
                    onChanged: (bool value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
