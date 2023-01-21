import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/meal_detail_screen.dart';

class MealItems extends StatelessWidget {
  const MealItems({
    required this.id,
     required this.title,
     required this.imageUrl, 
     required this.duration, 
     required this.complexity, 
     required this.affordability,
     });
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText{
    switch(complexity){
      case Complexity.simple:
      return 'Simple';
      break;
      case Complexity.challenging:
      return 'Challenging';
      break;
      case Complexity.hard:
      return 'Hard';
      break;
      default:
       return 'Unknown';
    }
    }

    String get affordabilityText{
      switch(affordability){
        case Affordability.Affordable:
        return 'Affordable';
        break;
        case Affordability.pricey:
        return 'Pricey';
        break;
        case Affordability.Luxuries:
        return 'luxurious';
        break;
        default: 
        return 'Unknown';
      }
    }
  
  
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id
    ).then(((value) {
      if(value != null){
        // removeItem(value);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
          
                  ),
                  child: Image.network(
                    imageUrl, 
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover, 
                  ),
                ),
                Positioned(
                  bottom: 20,
                  
                  right: 20,
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Monoton',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white
                      ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text(' $duration min ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text(' $complexityText',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(' $affordabilityText',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      )
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