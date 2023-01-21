import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        
                        bottomRight: Radius.circular(60)
                      ),
                      child: Image.network('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/3/0/FNM_110117-Insert-Opener_s4x3.jpg.rend.hgtvcom.616.462.suffix/1507047921977.jpeg',
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 149.1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45
                      ),
                      margin: EdgeInsets.only(
                        top: 20,
                      left: 20
                      ),
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: 250,
                      alignment: Alignment.centerLeft,
                      child: const Text('Cooking\t\t\t\tup\t\t\t\t!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Monoton',
                        fontWeight: FontWeight.w500,
                        fontSize: 26
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * (0.80 + 0.002),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                  
                    topRight: Radius.circular(60)
                  ),
                  child: Image.network('https://tildaricelive.s3.eu-central-1.amazonaws.com/wp-content/uploads/2022/06/10141800/Worldwide-Kitchen-Essentials.jpg',
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: double.infinity,
                  ),
                ),
                Column(
                 children: [
                      buildListTile(
                        'Meal\tPalace',
                        Icons.restaurant,
                        (){
                          Navigator.of(context).pushReplacementNamed( '/');
                        }),
                      buildListTile(
                        'Filters',
                         (Icons.settings),
                         (){
                          Navigator.of(context).pushReplacementNamed(
                            FilterScreen.routeName
                          );
                         }
                         ),
        ]
                )
              ]
            ),
          )],
      ),
    );
  }

  Container buildListTile(String title, IconData icon, Function() tapHandler) {
    return Container(
      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black45
                      ),
      margin: EdgeInsets.only(left: 20,top: 20),
      width: 250,
      child: ListTile(
                  leading: Icon(
                    icon, size: 26,
                    color: Colors.white,
                  ),
                  title:  Text(title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.w600,
                    fontSize: 24  ),
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  onTap: tapHandler,
                ),
    );
  }
}