import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData icon;

  DrawerItem(this.title, this.icon);
}

final drawerItems = [
  DrawerItem('Timeline (crowdsourced)', Icons.rss_feed),
  DrawerItem('Makan Place', Icons.fastfood),
  DrawerItem('Shopping Place', Icons.shopping_cart),
  DrawerItem('Settings', Icons.settings),
];