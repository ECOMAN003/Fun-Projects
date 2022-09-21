import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'colors.dart';
import 'package:todo/screens/add_page.dart';
import 'package:todo/screens/done_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  List<Widget> pages = const [AddPage(), DonePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: secondColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
          child: GNav(
            selectedIndex: currentIndex,
            gap: 10,
            tabs: const [
              GButton(
                icon: Icons.cabin_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.check_box,
                text: 'Done',
              )
            ],
            backgroundColor: secondColor,
            color: mainColor,
            activeColor: mainColor,
            tabBackgroundColor: thirdColor,
            padding: const EdgeInsets.all(10.0),
            onTabChange: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
