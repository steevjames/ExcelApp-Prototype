import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:excelapp_prototype/API/api_config.dart';

class EventsList {
  static Future<List<Event>> fetchEvents() async {
    APIConfig config = APIConfig();
    var response;
    try {
      response = await http.get(config.baseUrl);
    } catch (e) {
      print("Error $e");
    }
    Map<String, dynamic> responseData = json.decode(response.body);
    return responseData['events']
        .map<Event>((event) => Event.fromJson(event))
        .toList();
  }
}

class Event {
  int id;
  String name;
  String icon;
  String category;

  Event({this.id, this.name, this.icon, this.category});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      category: json['category'],
    );
  }
}
