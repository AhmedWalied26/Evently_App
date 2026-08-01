import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  bool isLoading = false;
  List<EventModel> eventList = [];
  List<EventModel> eventFavList = [];
  List<EventModel> eventFilterdFavList = [];

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

  Future<void> updateFavorite(EventModel event) {
    return FirebaseUtils.getEventCollection()
        .doc(event.eventId)
        .update({'is_favourite': !event.isFavourite})
        .then((value) async {
          event.isFavourite = !event.isFavourite;
          notifyListeners();
        })
        .catchError((error) {});
  }

  StreamSubscription<QuerySnapshot<EventModel>>? favoriteSubscription;
  Future<void> getFavoriteEvents() async {
    isLoading = true;
    notifyListeners();

    favoriteSubscription?.cancel();

    favoriteSubscription = FirebaseUtils.getEventCollection()
        .where('is_favourite', isEqualTo: true)
        .orderBy('event_date')
        .snapshots()
        .listen((querySnapshot) {
          eventFavList = querySnapshot.docs.map((doc) {
            return doc.data();
          }).toList();
          eventFilterdFavList = List.from(eventFavList);
          isLoading = false;
          notifyListeners();
        });
  }

  void searchFav(String text) {
    if (text.trim().isEmpty) {
      eventFilterdFavList = List.from(eventFavList);
    } else {
      eventFilterdFavList = eventFavList.where((event) {
        return event.eventTitle.toLowerCase().contains(text.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    favoriteSubscription?.cancel();
    super.dispose();
  }
}
