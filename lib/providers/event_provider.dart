import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  bool isLoading = false;
  List<EventModel> eventList = [];

  Future<void> getAllEvents() async {
    isLoading = true;
    notifyListeners();
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

  Future<void> getFilterEvents(int selectedIndex) async {
    isLoading = true;
    notifyListeners();
    try {
      var querySnapshot = await FirebaseUtils.getEventCollection()
          .where('event_category_index', isEqualTo: selectedIndex)
          .orderBy('event_date')
          .get();
      eventList = querySnapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
