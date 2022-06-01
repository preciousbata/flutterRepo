import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/data.dart';
import 'package:flutter_application_1/model/house.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //house properties
  List<HouseProperty> properties = [
    HouseProperty(bath: 2, bedroom: 3, sizee: 1000),
    HouseProperty(bath: 2, bedroom: 3, sizee: 2000),
    HouseProperty(bath: 3, bedroom: 3, sizee: 1000),
  ];

  Widget mysizedbox({required Icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        height: 50,
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon,
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget mytitle(
      {required double bottom,
      required String text,
      required double size,
      required double space}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottom,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: size, letterSpacing: space),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 5, 163),
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            mytitle(bottom: 8, text: 'Location', size: 12, space: 0),
            mytitle(
                bottom: 16,
                text: 'Liverpool, United States',
                size: 16,
                space: 0),
            mytitle(space: 1, bottom: 10, text: 'Hi Cahbagus,', size: 18),
            mytitle(
                space: 1, bottom: 40, text: 'What we can help you?', size: 18),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  mysizedbox(
                      Icon: const Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 8, 5, 163),
                      ),
                      text: 'House'),
                  mysizedbox(
                      Icon: const Icon(
                        Icons.apartment_rounded,
                        color: Color.fromARGB(255, 8, 5, 163),
                      ),
                      text: 'Apartment'),
                  mysizedbox(
                      Icon: const Icon(
                        Icons.hotel_rounded,
                        color: Color.fromARGB(255, 8, 5, 163),
                      ),
                      text: 'Hotel')
                ],
              ),
            )
          ],
        ),
        toolbarHeight: 250,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 152, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.notification_important_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 7,
                ),
                CircleAvatar(
                  radius: 10,
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Near You',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 263,
            width: double.infinity,
            child: ListView.builder(
                itemCount: Houses.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  House houses = Houses[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mycard(context, houses),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget mycard(BuildContext context, House Houses) {
    return Container(
      height: 263,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Color.fromARGB(255, 8, 5, 163),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(Houses.imageurl), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 8),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 8, 5, 163),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '\$${Houses.price}/Month',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color.fromARGB(255, 8, 5, 163),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        Houses.location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      Houses.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Facilities',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.apartment,
                    color: Color.fromARGB(255, 8, 5, 163),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('1000 m'),
                  SizedBox(
                    width: 11,
                  ),
                  Icon(
                    Icons.bed,
                    color: Color.fromARGB(255, 8, 5, 163),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('3 Bedrooms'),
                  SizedBox(
                    width: 11,
                  ),
                  Icon(
                    Icons.bathtub_rounded,
                    color: Color.fromARGB(255, 8, 5, 163),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('2 Baths')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
