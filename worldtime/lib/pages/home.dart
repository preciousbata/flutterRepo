import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.jpg':'night2.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blueAccent:Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,39.0,0,0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: (){
                          Navigator.pushNamed(context, '/location');
                      },
                      icon: const Icon(Icons.edit_location),
                    label: const Text('Edit Location'),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Text(data['time'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white
                      ),)
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}