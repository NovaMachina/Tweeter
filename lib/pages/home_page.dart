import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/models/status.dart';
import 'package:tweeter/models/user.dart';
import 'package:tweeter/utils/toast_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => ToastHelper.showToast('Profile Click'),
                child: CircleAvatar(
                  child: Text('JW'),
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Feed'),
                Tab(text: 'Story'),
                Tab(text: 'Followers'),
                Tab(text: 'Following'),
              ],
            ),
            title: Text('Tweeter'),
          ),
          body: TabBarView(
            children: [
              _buildStatusList(_feed),
              _buildStatusList(_story),
              _buildUserList(_followers),
              _buildUserList(_following),
            ],
          ),
        ),
      ),
    );
  }

  final _feed = <Status>[];
  final _story = <Status>[];
  final _followers = <WordPair>[];
  final _following = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildStatusList(list) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= list.length) {
            Status status = Status(
                "author", "timestamp", generateWordPairs().take(1).toString());
            list.add(status);
          }
          return _buildStatusRow(list[index]);
        });
  }

  Widget _buildStatusRow(Status status) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("JW"),
      ),
      title: Text(
        status.getAuthor,
        style: _biggerFont,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(status.getContent),
          Text(status.getTimestamp),
        ],
      ),
      onTap: () => ToastHelper.showToast(status.getContent),
    );
  }

  Widget _buildUserList(list) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= list.length) {
            User user = User("firstName", "lastName",
                generateWordPairs().take(1).toString(), null);
            list.add(user);
          }
          return _buildUserRow(list[index]);
        });
  }

  Widget _buildUserRow(User user) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("JW"),
      ),
      title: Text(
        user.getFirstName + " " + user.getLastName,
        style: _biggerFont,
      ),
      subtitle: Text(user.getAlias),
      onTap: () => ToastHelper.showToast(user.getAlias),
    );
  }
}
