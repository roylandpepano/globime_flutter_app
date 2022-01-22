import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // Location
  late String time; // Time on the location
  late String flag; // URL
  late String date;
  late String url;
  late bool isDayTime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      String link = "https://worldtimeapi.org/api/timezone/$url";
      // Make the request
      Response response = await get(Uri.parse(link));
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      print(offset);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset))); // add 8 offset to make it to real time

      // Date
      date = DateFormat('MMMM dd, yyyy').format(now);

      // Daytime or Nightime
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;

      // Store result in time variable
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Your internet connection is too slow.";
    }
  }
}
