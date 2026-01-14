import 'package:billfold/data/notifiers.dart';
import 'package:billfold/views/components/navbar_widget.dart';
import 'package:billfold/views/pages/moreoptionspage_view.dart';
import 'package:billfold/views/pages/homepage_view.dart';
import 'package:billfold/views/pages/inventorypage_view.dart';
import 'package:billfold/views/pages/invoicepage_view.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

List<Widget> pages = [
  HomePage(),
  InvoicePage(),
  InventoryPage(),
  MoreOptionsPage(),
];

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("BillFold Print")),
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
