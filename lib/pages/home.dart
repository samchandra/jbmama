import 'package:flutter/material.dart';

import '../fragments/makan-place.dart';
import '../fragments/settings.dart';
import '../fragments/shopping-place.dart';
import '../fragments/timeline.dart';


class DrawerItem {
  final String title;
  final IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  
  final drawerItems = [
    DrawerItem('Timeline', Icons.rss_feed),
    DrawerItem('Makan Place', Icons.fastfood),
    DrawerItem('Shopping Place', Icons.shopping_cart),
    DrawerItem('Settings', Icons.settings),
  ];

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new TimelineFragment();
      case 1:
        return new MakanPlaceFragment();
      case 2:
        return new ShoppingPlaceFragment();
      case 3:
        return new SettingsFragment();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  AppBar _getAppBarForItem(int pos) {
    switch (pos) {
      case 0:
        return AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                isScrollable: false,
                tabs: [Tab(text: "SG to JB"), Tab(text: "JB to SG")],
              ),
            );
      default:
        return AppBar(
          title: Text(widget.title),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget _drawer = Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("taylor@swift.com"),
            accountName: Text("Taylor Swift"),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://1075koolfm.com/wp-content/uploads/2018/04/taylor-swift-grammys-2015-a-billboard-1548-1000x500.jpg")),
          ),
          ListTile(
            title: Text(widget.drawerItems[0].title),
            trailing: Icon(widget.drawerItems[0].icon),
            selected: _selectedDrawerIndex == 0,
            onTap: () => _onSelectItem(0),
          ),
          ListTile(
            title: Text(widget.drawerItems[1].title),
            trailing: Icon(widget.drawerItems[1].icon),
            selected: _selectedDrawerIndex == 1,
            onTap: () => _onSelectItem(1),
          ),
          ListTile(
            title: Text(widget.drawerItems[2].title),
            trailing: Icon(widget.drawerItems[2].icon),
            selected: _selectedDrawerIndex == 2,
            onTap: () => _onSelectItem(2),
          ),
          Divider(),
          ListTile(
            title: Text(widget.drawerItems[3].title),
            trailing: Icon(widget.drawerItems[3].icon),
            selected: _selectedDrawerIndex == 3,
            onTap: () => _onSelectItem(3),
          ),
        ],
      ),
    );

    if (_selectedDrawerIndex == 0) {
      return DefaultTabController(
        length: 2, 
        child: Scaffold(
            appBar: _getAppBarForItem(_selectedDrawerIndex),
            drawer: _drawer,
            body: _getDrawerItemWidget(_selectedDrawerIndex),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor, 
                child: Icon(Icons.photo_camera),
                onPressed: () => print("Create Feed")
            ),
        ),
      ); 
    } else {
      return Scaffold(
        appBar: _getAppBarForItem(_selectedDrawerIndex),
        drawer: _drawer,
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      );
    }

    
  }
}
