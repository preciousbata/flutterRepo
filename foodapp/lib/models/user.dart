import 'package:foodapp/models/order.dart';


class User{
  String name;
  List<Order>orders;
  List<Order> cart;

  User({
    required this.name,
    required this.cart,
    required this.orders,
});
}