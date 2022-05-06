import 'package:foodapp/models/food.dart';
import 'package:foodapp/models/restaurant.dart';

class Order{
  Restaurant restaurant;
  Food food;
  String date;
  int quantity;

  Order({
    required this.restaurant,
    required this.date,
    required this.food,
    required this.quantity,
});
}