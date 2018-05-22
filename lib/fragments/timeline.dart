import 'package:flutter/material.dart';

import '../models/feed.dart';
import '../widgets/feed-card.dart';

class TimelineFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return TabBarView(
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
       
    );
  }


}