import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  static const String collectionName = 'Events';

  String? eventId;
  final String eventLightImage;
  final String eventDarkImage;
  final String eventName;
  final String eventTitle;
  final String eventDescription;
  final DateTime eventDate;
  final bool isFavourite;

  EventModel({
    this.eventId,
    required this.eventLightImage,
    required this.eventDarkImage,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    this.isFavourite = false,
  });

  EventModel.fromJson(Map<String, dynamic> data)
    : this(
        eventId: data['event_id'],
        eventLightImage: data['event_light_image'],
        eventDarkImage: data['event_dark_image'],
        eventName: data['event_name'],
        eventTitle: data['event_title'],
        eventDescription: data['event_description'],
        eventDate: (data['event_date'] as Timestamp).toDate(),
        isFavourite: data['is_favourite'],
      );

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'event_light_image': eventLightImage,
      'event_dark_image': eventDarkImage,
      'event_name': eventName,
      'event_title': eventTitle,
      'event_description': eventDescription,
      'event_date': eventDate,
      'is_favourite': isFavourite,
    };
  }
}
