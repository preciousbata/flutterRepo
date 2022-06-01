import 'package:flutter/material.dart';

class HouseProperty {
  int sizee;
  int bedroom;
  int bath;

  HouseProperty(
      {required this.bath, required this.bedroom, required this.sizee});
}

class House {
  String name;
  String location;
  int price;
  String imageurl;

  House({
    required this.name,
    required this.location,
    required this.price,
    required this.imageurl,
  });
}
