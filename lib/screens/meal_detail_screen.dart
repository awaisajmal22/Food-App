import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/models/caetegorieswithmeal.dart';
import 'package:food_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetail';
  final  Function addFavorit;
  final Function isFavorit;

  const MealDetailScreen(this.addFavorit, this.isFavorit, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)
    ?.settings.arguments as String;
    final selectedMeal = dummy_meal.firstWhere(
      (meal) => meal.id == mealId
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer( ListView.builder(
                itemCount: selectedMeal.ingredient.length,
                itemBuilder: (context, index){
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredient[index]),
                    ),
                  );
                })
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: Colors.black45,
                          thickness: 1,
                        ),
                      )
                    ],
                  );
                }
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> addFavorit(mealId),
        child: Icon(isFavorit(mealId) ? Icons.favorite : Icons.favorite_border))
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(title,
          style: TextStyle(
            fontFamily: 'Monoton',
            fontWeight: FontWeight.bold,
            fontSize: 26
          ),
          ),
        );
  }

Container buildContainer(Widget child){
     return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 300,
            child: child
  );
}
}