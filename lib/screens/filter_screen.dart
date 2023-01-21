import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';
final Function setFilter;
 final Map<String, bool> currentfiler;

  const FilterScreen({Key? key, required  this.setFilter, required this.currentfiler}) : super(key: key);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
 bool _glutenFree = false;
 bool _vegetarian = false;
 bool _vegan = false;
 bool _lactosFree = false;

 @override
  void initState() {
    _glutenFree = widget.currentfiler['gluten'] ?? _glutenFree;
    _lactosFree = widget.currentfiler['lactos'] ?? _lactosFree;
    _vegan = widget.currentfiler['vegan'] ?? _vegan;
    _vegetarian = widget.currentfiler['vegetarian'] ?? _vegetarian;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              final selectedFilter = {
                'gluten': _glutenFree,
                'Lactos': _lactosFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.setFilter(selectedFilter);
            },
             icon: Icon(Icons.save)
             )
        ],
        title: Text('Your\t\tFilter',
        style: TextStyle(
          fontFamily: 'Monoton',
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust Your Meal Selection",
            style: TextStyle(
              fontSize: 30
            ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitcListTile(
                  'Only Include Gluten-Free Meals',
                  'Gulten-Free',
                  _glutenFree,
                  (newVal){
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }
                  ),
                  buildSwitcListTile(
                    'Only Include Lactose-Free Meals', 
                    'Lactose-Free',
                     _lactosFree, 
                     (newVal){
                      setState(() {
                        _lactosFree = newVal;
                      });
                     }
                  ),
                  buildSwitcListTile(
                  'Only Include Vegan', 
                  'Vegan', 
                  _vegan,
                   (newVal){
                    setState(() {
                      _vegan = newVal;
                    });
                   }),
                   buildSwitcListTile(
                    'Only Include Vegetarian', 
                    'Vegetarian', 
                    _vegetarian, 
                    (newVal){
                      setState(() {
                        _vegetarian = newVal;
                      });
                    }
                    )
              ],
            )
          ),
          
        ],
      ),
    );
  }

  SwitchListTile buildSwitcListTile(String subtitle, String title, bool currentVal,Function(bool) updateVal) {
    return SwitchListTile(
                subtitle: Text(subtitle),
                title: Text(title),
                value: currentVal,
                onChanged: updateVal,
              );
  }
}