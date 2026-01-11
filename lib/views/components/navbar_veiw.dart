import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.receipt), label: "Bills"),
        NavigationDestination(icon: Icon(Icons.inventory), label: "Inventory"),
        NavigationDestination(icon: Icon(Icons.person), label: "Customers"),
      ],
    );
  }
}
