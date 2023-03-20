import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String time = ""; // now time of location
  String url; // the api for location
  String location; // the description for location
  bool? isDayTime; // flay night or day

  WorldTime(
      {required this.location, required this.url, this.isDayTime});

  Future<void> getTime() async {
    try {
      String baseUrl = 'https://worldtimeapi.org/api/timezone/$url';
      Response response = await get(Uri.parse(baseUrl));
      Map<String, dynamic> data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      DateTime now = DateTime.parse(datetime);
      // this offset could '-' or '+'
      int offsetNum = int.parse(offset);
      if (offsetNum < 0) {
        now = now.subtract(Duration(hours: -offsetNum));
      } else {
        now = now.add(Duration(hours: offsetNum));
      }
      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (err) {
      time = 'GET TIME COULD ERROR';
    }
  }
}
