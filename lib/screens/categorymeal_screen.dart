import 'package:flutter/material.dart';
import 'package:food_app/models/caetegorieswithmeal.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = '/categories';
final List<Meal>  avalilableMeal;
CategoryMeal(this.avalilableMeal);
  @override
  State<CategoryMeal> createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  
   late String title;
   late List<Meal> displayMeals;
   bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
   final routeArgs = 
    ModalRoute.of(context)
    ?.settings.arguments as Map<String, String>;
    title = routeArgs['title']!;
    final id = routeArgs['id'];
    displayMeals = widget.avalilableMeal.where((meal){
      return meal.categories.contains(id);
    }).toList();
    _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere(
        (meal)=> meal.id == mealId
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        title: Text(title,
        style: TextStyle(
          fontFamily: 'Monoton',
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: displayMeals[index].id,
            title: displayMeals[index].title, 
            imageUrl: displayMeals[index].imageUrl, 
            duration: displayMeals[index].duration, 
            complexity: displayMeals[index].complexity, 
            affordability: displayMeals[index].affordability,
            );
        },
        itemCount: displayMeals.length,
        )
    );
  }
}