import 'package:flutter/material.dart';

import '../models/feed.dart';

class FeedCard extends StatelessWidget {
  final Feed _feed;

  FeedCard(this._feed);

  @override
  Widget build(BuildContext context) {
    Widget _userAvatar = CircleAvatar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(_feed.avatarURL));

    Widget _userMessage = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(_feed.userName, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(_feed.message),
      ],
    );

    Widget _userPhoto = Image(
      image: NetworkImage(_feed.imgURL),
    );

    Widget _userActions = Row(children: <Widget>[
      Expanded(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.thumb_up, color: Colors.grey),
                  tooltip: "Like",
                  onPressed: () => print("Like It")),
              Text("123", style: TextStyle(fontSize: 12.0, color: Colors.grey))
            ]),
      ),
      Expanded(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.comment, color: Colors.grey),
                  tooltip: "Comment",
                  onPressed: () => print("Like It")),
              Text("5", style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            ]),
      )
    ]);

    Widget _rightContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: _userMessage),
        _userPhoto,
        _userActions
      ],
    );

    return Card(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(padding: const EdgeInsets.all(5.0), child: _userAvatar),
            Expanded(child: _rightContent)
          ],
        ));
  }
}
