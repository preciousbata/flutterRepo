import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/models/food.dart';

class RestaurantScreen extends StatefulWidget {

  final Restaurant restaurant;

  const RestaurantScreen({required this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  _buildMenuItem(Food menuItem){
    return Center(
      child: Stack(
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(menuItem.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.deepOrange,
                ),
                ),
                const SizedBox(height: 7,),
                Text('N ${menuItem.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                ),
              ],
            ),
          ),
          // TODO:ask king for break down
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: const [
                  0.1,0.4,0.6,0.9
                ],
              ),
            ),
          ),
          //add widget
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 42,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              //borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/mayor_logo.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 35, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 43,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(130.0)),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: Colors.deepOrange,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                widget.restaurant.name,
                                style: const TextStyle(
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            Center(
                              child: Text(
                                widget.restaurant.address,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
            //TODO: ask king for break down
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
