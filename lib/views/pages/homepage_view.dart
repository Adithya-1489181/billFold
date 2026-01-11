import 'package:billfold/views/components/navbar_veiw.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("BillFold Print")),
        body: Center(child: Text("Hello")),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
