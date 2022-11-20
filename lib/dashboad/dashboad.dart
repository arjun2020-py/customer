import 'package:flutter/material.dart';
import '../HomeNavigtionScreen/Profile_screen.dart';
import '../HomeScreen/view/home.dart';
import '../dawerScreen/naviationbar.dart';

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({super.key});

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  int _currentIndex = 0;

  List<Widget> widget1 = [
    HomeSceen(),
    const Text("data"),
    const Text("data"),
    const ProfileScreen1()
  ];
  @override
  Widget build(BuildContext context) {
    return _currentIndex != 3
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff202020),
              title: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Online",
                    style: TextStyle(color: Color(0xffec1867)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Shopper",
                    style: TextStyle(color: Color(0xffffffff)),
                  )
                ],
              ),
              actions: const [
                Icon(
                  Icons.search,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
              ],
            ),
            drawer: const NavigationScreen(),
            body: widget1[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xff202020),
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: "Home",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: "Search",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: Colors.white,
                    ),
                    label: "Favorite",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: "Profile",
                    backgroundColor: Color(0xff202020),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          )
        : Scaffold(
            body: widget1[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xff202020),
                currentIndex: _currentIndex,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: "Home",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    label: "Search",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_sharp,
                      color: Colors.white,
                    ),
                    label: "Favorite",
                    backgroundColor: Color(0xff202020),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: "Profile",
                    backgroundColor: Color(0xff202020),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          );
  }
}
