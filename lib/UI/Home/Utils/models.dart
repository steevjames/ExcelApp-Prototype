class Sponser {
  String imageUrl;
  String url;

  Sponser({this.imageUrl, this.url});

  Sponser.fromMapObject(Map<String, dynamic> map) {
    this.imageUrl = map['imageUrl'];
    this.url = map['url'];
  }
}

class Event {
  String eventName;
  String imageUrl;
  String date;
  String time;

  Event({this.eventName, this.imageUrl, this.date, this.time});

  Event.fromMapObject(Map<String, dynamic> map){
    this.eventName = map['eventName'];
    this.imageUrl = map['imageUrl'];
    this.date = map['date'];
    this.time = map['time'];
  }
}


