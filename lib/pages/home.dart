import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/drawer-item.dart';
import '../fragments/makan-place.dart';
import '../fragments/settings.dart';
import '../fragments/shopping-place.dart';
import '../fragments/timeline.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedDrawerIndex = 0;

  Widget _getDrawerItemWidget(int pos) {
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
  
  void _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  AppBar _getAppBarForItem(int pos) {
    switch (pos) {
      case 0:
        return AppBar(
              title: Text(drawerItems[_selectedDrawerIndex].title),
              bottom: TabBar(
                isScrollable: false,
                tabs: [Tab(text: "SG to JB"), Tab(text: "JB to SG")],
              ),
            );
      default:
        return AppBar(
          title: Text(drawerItems[_selectedDrawerIndex].title),
        );
    }
  }

  Future<String> _message = new Future<String>.value('');

  Future<String> _testSignInAnonymously() async {

    final FirebaseUser user = await _auth.signInAnonymously();

    print("user: $user");

    assert(user != null);
    assert(user.isAnonymous);
    assert(!user.isEmailVerified);
    assert(await user.getIdToken() != null);

    if (Platform.isIOS) {
      // Anonymous auth doesn't show up as provider on IOS
      assert(user.providerData.isEmpty);
    } else if (Platform.isAndroid) {
      // Anonymous auth does show up as a provider on Android
      assert(user.providerData.length == 1);
      // assert(user.providerData[0].providerId == 'firebase');
      // assert(user.providerData[0].uid != null);
      // assert(user.providerData[0].displayName == null);
      // assert(user.providerData[0].photoUrl == null);
      // assert(user.providerData[0].email == null);

      print("user.providerId: ${user.providerData[0].providerId}");
      print("user.uid: ${user.providerData[0].uid}");
      print("user.displayName: ${user.providerData[0].displayName}");
      print("user.photoUrl: ${user.providerData[0].photoUrl}");
      print("user.email: ${user.providerData[0].email}");
    }

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInAnonymously succeeded: $user';
  }

  @override
  void initState() {
    super.initState();

    print("_HomePageState initState called");
    setState(() {
      _message = _testSignInAnonymously();
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    final Widget _drawer = Drawer(
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
            title: Text(drawerItems[0].title),
            trailing: Icon(drawerItems[0].icon),
            selected: _selectedDrawerIndex == 0,
            onTap: () => _onSelectItem(0),
          ),
          ListTile(
            title: Text(drawerItems[1].title),
            trailing: Icon(drawerItems[1].icon),
            selected: _selectedDrawerIndex == 1,
            onTap: () => _onSelectItem(1),
          ),
          ListTile(
            title: Text(drawerItems[2].title),
            trailing: Icon(drawerItems[2].icon),
            selected: _selectedDrawerIndex == 2,
            onTap: () => _onSelectItem(2),
          ),
          Divider(),
          ListTile(
            title: Text(drawerItems[3].title),
            trailing: Icon(drawerItems[3].icon),
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
