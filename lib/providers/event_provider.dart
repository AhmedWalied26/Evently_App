import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  bool isLoading = true;
  List<EventModel> eventList = [];

  Future<void> getAllEvents() async {
    try {
      var querySnapshot = await FirebaseUtils.getEventCollection().get();
      eventList = querySnapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
