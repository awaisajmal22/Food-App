import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/models/caetegorieswithmeal.dart';
import 'package:food_app/screens/categorymeal_screen.dart';
import 'package:food_app/screens/filter_screen.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import 'package:food_app/screens/tab_screen.dart';

import 'models/meal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  // This widget is the root of your application.
  Map<String, bool> _filter = {
    'gluten': false,
    'Lactos': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal>? _availableMeals = dummy_meal;
  List<Meal> _favoriteMeal = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
@override
void didChangeAppLifeCycleState(AppLifecycleState state){
     print(state);
}
@override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  void _setFilterState(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = dummy_meal.where((meal) { 
         if (_filter['gluten'] == true && !meal.isGlutenFree){
          return false;
        }
        if(_filter['lactos']== true  && !meal.isLactosFree){
          return false;
        }
        if(_filter['vegan'] == true && !meal.isVegan){
          return false;
        }
        if(_filter['vegetarian'] == true && !meal.isVegetarian){
          return false;
        }
        return true;
      },).toList();
    });
  }
  void _favorit(String mealId){
    final existingIndex = _favoriteMeal.indexWhere((meal)=> meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }
    else {
      _favoriteMeal.add(dummy_meal.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isFavorit(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.grey,
        fontFamily: 'CabinSketch',
        // canvasColor: Color.fromRGBO(255, 243, 242, 1),
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favoriteMeal),
        CategoryMeal.routeName: (context) => CategoryMeal(_availableMeals!),
        MealDetailScreen.routeName:(context) => MealDetailScreen(_favorit,isFavorit),
        FilterScreen.routeName:(context) => FilterScreen(currentfiler: _filter, setFilter: _setFilterState,)
      },
      // onGenerateRoute: ((settings) {
      //   return MaterialPageRoute(builder: (context) => Catrgories());
      // }),
    );
  }
}

