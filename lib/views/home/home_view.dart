import 'package:flutter/material.dart';
import 'home_hero_section.dart';
import 'home_services_section.dart';
import 'home_bottom_navigation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedNavIndex = 0; // for bottom bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Hero section with top search bar and mic
          HomeHeroSection(),
          SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Hire hand-picked Pros for popular music services',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          // Services section fetched from Firebase
          HomeServicesSection(),
          // Bottom navigation
          HomeBottomNavigation(
            selectedIndex: selectedNavIndex,
            onItemSelected: (index) {
              setState(() {
                selectedNavIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}