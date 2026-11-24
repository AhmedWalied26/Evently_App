# Evently App

A Flutter event management app backed by Firebase: create, browse, favorite and manage events, with full Arabic/English and light/dark support.

## Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/14-evently-1.webp" width="170" alt="Evently app screenshot 1">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/15-evently-2.webp" width="170" alt="Evently app screenshot 2">
  <img src="https://raw.githubusercontent.com/AhmedWalied26/My_Portfolio/main/images/16-evently-3.webp" width="170" alt="Evently app screenshot 3">
</p>

## Features

- Email/password and Google sign-in with Firebase Authentication, plus password reset
- Onboarding with theme and language personalization
- Create, update and delete events with category, date, time and image
- Home feed with category filter tabs
- Favorites tab for saved events
- Profile tab with theme and language switching
- Connectivity-aware: listens for network changes and adapts
- English and Arabic localization

## Tech Stack

- **Flutter** / Dart
- **State management:** Provider
- **Backend:** Firebase Authentication, Cloud Firestore, Google Sign-In
- **Local storage:** SharedPreferences
- **UI:** google_fonts, flutter_svg, animated_toggle_switch, smooth_page_indicator, fluttertoast
- **Utilities:** connectivity_plus, image_picker

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedWalied26/Evently_App.git
   cd Evently_App
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your own Firebase configuration (`firebase_options.dart`) via FlutterFire CLI.
4. Run the app:
   ```bash
   flutter run
   ```
