import 'package:foodapp/models/food.dart';

class Restaurant{
  String imageUrl;
  String name;
  String address;
  int rating;
  List<Food>menu;


  Restaurant({
    required this.address,
    required this.imageUrl,
    required this.menu,
    required this.name,
    required this.rating,
});
}