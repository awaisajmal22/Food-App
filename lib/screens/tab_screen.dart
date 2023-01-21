import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/favorite_screen.dart';
import 'package:food_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
final List<Meal> favorit;
TabScreen(this.favorit);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;  
@override
  void initState() {
    _pages = [
  {'page': Catrgories(), 'label':'Categories'},
  {'page': Favorite(favorit: widget.favorit,), 'label': 'Favorite'}
];
    super.initState();
  }
int _selectedPageIndex = 0;
void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return
    //  DefaultTabController(
    // length: 2, 
    // child: 
    Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(_pages[_selectedPageIndex]['label'] as String,
        style: TextStyle(
          fontFamily: 'Monoton',
          fontWeight: FontWeight.bold
        ),),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category ),
        //       text: 'Categories',
        //       ),
        //     Tab(
        //       icon: Icon(Icons.favorite),
        //       text: 'Favorite',
        //     )
        //   ],
        // ),
      // ),
      // body: TabBarView(
      //   children: [
      //     Catrgories(),
      //     Favorite()
        ),

      body: Stack(
        children: [
          Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/3/0/FNM_110117-Insert-Opener_s4x3.jpg.rend.hgtvcom.616.462.suffix/1507047921977.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          ),
          _pages[_selectedPageIndex]['page'] as Widget,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black38,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorite'
              )
            
        ],
        ),
    // )
    );
  }
}