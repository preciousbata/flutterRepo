import 'package:flutter_application_1/model/house.dart';

//Houses
final _house1 = House(
  price: 560,
  name: 'Hobbit House Summer',
  location: 'Kec, Liverpool',
  imageurl: 'assets/h1.jpg',
);
final _house2 = House(
  price: 500,
  name: 'White House',
  location: 'Zone 6',
  imageurl: 'assets/h2.jpg',
);
final _house3 = House(
  price: 579,
  location: 'Enugu',
  name: 'Lagos',
  imageurl: 'assets/h3.jpg',
);

final List<House> Houses = [_house1, _house2, _house3];
