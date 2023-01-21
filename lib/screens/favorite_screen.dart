import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favorit;

  const Favorite({Key? key, required this.favorit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(favorit.isEmpty){
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black45
            ),
            padding: EdgeInsets.only(left: 20,right: 20),
            width: 300,
            height: 100,
            child: Center(
              child: Text("Not Added any of Favorit item yet",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
              overflow: TextOverflow.fade,
              softWrap: true,
              )
              )
            ),
        ],
      ),
    );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItems(
            id: favorit[index].id,
            title: favorit[index].title, 
            imageUrl: favorit[index].imageUrl, 
            duration: favorit[index].duration, 
            complexity: favorit[index].complexity, 
            affordability: favorit[index].affordability, 
           );
        },
        itemCount: favorit.length,
        );
    }
  }
}