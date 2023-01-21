import 'package:flutter/material.dart';
import 'package:food_app/widgets/category_item.dart';
import 'package:food_app/widgets/main_drawer.dart';

import '../models/caetegorieswithmeal.dart';
import '../models/meal.dart';

class Catrgories extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/3/0/FNM_110117-Insert-Opener_s4x3.jpg.rend.hgtvcom.616.462.suffix/1507047921977.jpeg',
          fit: BoxFit.fitHeight,
          height: double.infinity,
          width: double.infinity,
          ),
          GridView(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  ),
                  children: dummy_Category.map((e) => CategoryItem(
                    id: e.id,
                    title: e.title,
                    color: e.color,
                    )).toList()
              ),
        ],
      ),
        
    );
     
  }
}