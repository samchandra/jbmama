import 'package:flutter/material.dart';

import '../models/feed.dart';
import '../models/tabModule.dart';
import '../widgets/feedCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            title: Text("Makan Places"),
            trailing: Icon(Icons.fastfood),
          ),
          ListTile(
            title: Text("Shopping Places"),
            trailing: Icon(Icons.shopping_cart),
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
          ),
        ],
      ),
    );

    return DefaultTabController(
        length: tabModules.length,
        child: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              bottom: TabBar(
                isScrollable: false,
                tabs: tabModules.map((TabModule tab) {
                  return Tab(text: tab.title);
                }).toList(),
              ),
            ),
            drawer: _drawer,
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                    itemCount: sampleFeed.length,
                    itemBuilder: (context, i) => Column(
                          children: <Widget>[FeedCard(sampleFeed[i])],
                        )),
                ListView.builder(
                    itemCount: sampleFeed2.length,
                    itemBuilder: (context, i) => Column(
                          children: <Widget>[FeedCard(sampleFeed2[i])],
                        )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor, 
              child: Icon(Icons.photo_camera),
              onPressed: () => print("Create Feed")
            ),
          )
    );
  }
}
