import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final Function(int index) onTap;

  const BottomNavBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Upcoming',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stars),
          label: 'Popular',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      selectedItemColor: Colors.white,
      currentIndex: index,
      onTap: onTap,
    );
  }
}
