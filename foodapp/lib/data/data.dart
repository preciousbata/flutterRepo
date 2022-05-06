import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/order.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/models/user.dart';

//Food
final _friedRice =
    Food(name: 'Fried Rice', imageUrl: 'assets/friedrice.jpg', price: 1250.25);
final _afang =
    Food(name: 'Afang Soup', imageUrl: 'assets/Afang-soup.png', price: 950.34);
final _melonSoup =
    Food(name: 'Melon Soup', imageUrl: 'assets/Egusi_soup.jpg', price: 925.30);
final _jollofRice =
    Food(name: 'Jollof Rice', imageUrl: 'assets/Jollof-Rice.jpg', price: 925.30);
final _whiteSoup =
    Food(name: 'White Soup', imageUrl: 'assets/whitesoup2.jpg', price: 925.30);
final _friedPlantian = Food(
    name: 'Fried Plantain',
    imageUrl: 'assets/freidplantian.jpg',
    price: 723.50);
final _sharwarma =
    Food(name: 'Sharwarma', imageUrl: 'assets/sharwarma.jpg', price: 1224.30);

//Restaurant
final _mayorDining = Restaurant(
    address: 'Immanuel Hospital Hub',
    imageUrl: 'assets/mayor_logo.jpg',
    menu: [
      _friedRice,
      _afang,
      _friedPlantian,
      _jollofRice,
      _melonSoup,
      _sharwarma,
      _whiteSoup
    ],
    name: 'Mayor Dining',
    rating: 3);

final List<Restaurant> restaurants = [
  _mayorDining,
];

final _orders = List.generate(6, (index) =>  Order(
    restaurant: _mayorDining, date: '20/03/2020', food: _afang, quantity: 2));


//User
final currentUser = User(
  name: 'Precious Batta',
  cart: [
    Order(
        restaurant: _mayorDining,
        date: '20/3/2020',
        food: _melonSoup,
        quantity: 1)
  ],
  orders: _orders,
);
