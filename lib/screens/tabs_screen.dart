import 'package:KitchenKing/models/meals.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favorit;
  TabsScreen(this.favorit);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  int _selectedpageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favorit), 'title': 'Favourites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedpageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedpageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green[400],
        currentIndex: _selectedpageIndex,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
      ),
    );
  }
}
