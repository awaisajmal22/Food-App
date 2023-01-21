import 'package:flutter/material.dart';
import 'package:food_app/screens/categorymeal_screen.dart';


class CategoryItem extends StatelessWidget {
  const CategoryItem({ required this.title, required this.color, required this.id});
  final String id;
  final String title;
  final Color color;
  
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      CategoryMeal.routeName, 
    arguments: {
      'id': id,
      'title': title,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: ()=> selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 200,
                height: 50,
                child: Text(title,
                style:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
                ),
              ),
            
            ),
          ],
        ),
      ),
    );
  }
}