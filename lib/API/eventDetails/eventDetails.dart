import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:excelapp_prototype/API/api_config.dart';

class EventDetailsAPI {
  static Future<EventDetails> fetchEventDetails(String endpoint) async {
    // APIConfig config = APIConfig();
    var response;
    try {
      response = await http.get("https://demo1680243.mockable.io/events/1");
    } catch (e) {
      print("Error $e");
    }
    Map<String,dynamic> responseData = json.decode(response.body);
    EventDetails event = EventDetails.fromJson(responseData);
    return event;
  }
}

class EventDetails {
  int id;
  String name;
  String category;
  String venue;
  String prize;
  String dateTime;

  String about;
  String format;
  String rules;
  List<dynamic> contacts;

  EventDetails(
      {this.id,
      this.name,
      this.category,
      this.venue,
      this.prize,
      this.dateTime,
      this.about,
      this.format,
      this.rules,
      this.contacts});

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        venue: json['venue'],
        prize: json['prize_money'],
        dateTime: json['date_time'],
        about: json['about'],
        format: json['format'],
        rules: json['rules'],
        // spelling mistake in api
        contacts: json['conatcts']);
  }

  Map<String, dynamic> toJson() {
    return ({
      'id': id,
      'name': name,
      'category': category,
      'venue': venue,
      'prize_money': prize,
      'date_time': dateTime,
      'about': about,
      'format': format,
      'rules': rules,
      // no contacts added
    });
  }
}
