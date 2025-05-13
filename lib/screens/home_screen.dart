import 'package:flutter/material.dart';
import 'package:spotify_test/models/menu_model.dart';
import 'package:spotify_test/screens/explore_page.dart';
import 'package:spotify_test/screens/home_page.dart';
import 'package:spotify_test/screens/library_page.dart';
import 'package:spotify_test/screens/samples_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexSelected = 0;
  List<MenuNavModel> listPage = [
    MenuNavModel(
      child: const HomePage(),
      label: 'Home',
      icon: Icons.home_rounded,
    ),
    MenuNavModel(
      child: const SamplesPage(),
      label: 'Samples',
      icon: Icons.double_arrow_rounded,
    ),
    MenuNavModel(
      child: const ExplorePage(),
      label: 'Explores',
      icon: Icons.explore_outlined,
    ),
    MenuNavModel(
      child: const LibraryPage(),
      label: 'Library',
      icon: Icons.library_music_outlined,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left, size: 32, color: Colors.white),
        leadingWidth: 48,
        backgroundColor: const Color(0xff121212),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Icon(
                  Icons.search_sharp,
                  size: 32,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFFF5100),
                    child: Text(
                      "P",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        titleSpacing: 0,
        title: Container(
          child: Row(
            children: [
              Container(
                child: const Text(
                  'Mixed For You',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: listPage[indexSelected].child,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          //Here goes the same radius, u can put into a var or function
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1f000000),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey.shade900,
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          iconSize: 32,
          currentIndex: indexSelected,
          onTap: onItemTapped,
          items: <BottomNavigationBarItem>[
            ...listPage
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }

  void onItemTapped(int value) {
    setState(() {
      indexSelected = value;
    });
  }
}
