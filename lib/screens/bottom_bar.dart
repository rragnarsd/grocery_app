import 'package:flutter/material.dart';
import 'package:grocery_app/screens/cart.dart';
import 'package:grocery_app/screens/feeds.dart';
import 'package:grocery_app/screens/home.dart';
import 'package:grocery_app/screens/search.dart';
import 'package:grocery_app/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home Screen',
      },
      {
        'page': FeedsScreen(),
        'title': 'Feeds Screen',
      },
      {
        'page': SearchScreen(),
        'title': 'Search Screen',
      },
      {
        'page': CartScreen(),
        'title': 'Cart Screen',
      },
      {
        'page': UserScreen(),
        'title': 'User Screen',
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
              onTap: _selectedPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.indigo,
              currentIndex: _selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  tooltip: 'Home',
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed),
                  tooltip: 'Feeds',
                  label: 'Feeds',
                ),
                BottomNavigationBarItem(
                  icon: Icon(null),
                  activeIcon: null,
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    tooltip: 'Cart',
                    label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  tooltip: 'User',
                  label: 'User',
                ),
              ]),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          tooltip: 'Search',
          elevation: 5,
          child: (Icon(Icons.search)),
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
      ),
    );
  }
}
