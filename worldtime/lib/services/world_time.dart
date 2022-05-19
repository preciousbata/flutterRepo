import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'dart:convert';
import 'dart:core';

class WorldTime {
  String location; //location for UI
  String flag; // flag asset
  late String time;
  String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async {
    try {
      // network request from a third-party API
      var link = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(link);
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      String dateTime = intl.DateFormat("yyyy-MM-dd'T'HH:mm:ss")
         .format(DateTime.parse(datetime));

      //create datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDayTime = now.hour >6 && now.hour < 18 ? true:false;
      time = intl.DateFormat.jm().format(now);
      //intl.DateFormat('hh:mm a').format(
          //DateTime.parse(dateTime).add(Duration(hours: int.parse(offset))));
    }
    catch (e) {print('Caught error:$e');}
  }
}
