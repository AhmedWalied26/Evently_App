import 'package:evently_app/features/home/custom_bottom_navigation_bar.dart';
import 'package:evently_app/features/home/taps/favorites_tap/favorites_tap.dart';
import 'package:evently_app/features/home/taps/home_tap/home_tap.dart';
import 'package:evently_app/features/home/taps/profile_tap/profile_tap.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> taps = [HomeTap(), FavoritesTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      body: taps[currentIndex],
    );
  }
}
