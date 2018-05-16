import 'package:flutter/material.dart';

class TabModule {
  final String title;
  final IconData icon;

  TabModule(this.title, this.icon);
}

List<TabModule> tabModules = <TabModule>[
  TabModule("SG to JB", Icons.arrow_upward),
  TabModule("JB to SG", Icons.arrow_downward),
];
