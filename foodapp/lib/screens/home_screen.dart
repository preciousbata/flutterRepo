import 'package:flutter/material.dart';
import 'package:foodapp/data/data.dart';
import 'package:foodapp/screens/restaurant_screen.dart';
import 'package:foodapp/widgets/recent_order.dart';
import 'package:foodapp/models/restaurant.dart';

import 'cartScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // building nearby Restaurant function
  Widget _buildRestaurants() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant)),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade50,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      restaurant.address,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
        ),
        title: const Text(
          'Mayor Dining',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => cartScreen(),
              ),
            ),
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(width: 0.7)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                    width: 0.7, color: Colors.deepOrangeAccent),
              ),
              hintText: 'Search for food',
              prefixIcon: const Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const RecentOrders(),
        const SizedBox(
          height: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Nearby Restaurants',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            _buildRestaurants(),
          ],
        ),
      ]),
    );
  }
}
