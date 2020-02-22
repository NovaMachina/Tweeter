import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                onTap: () => _showToast('Profile Click'),
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
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              _buildList(_feed),
              _buildList(_story),
              _buildList(_followers),
              _buildList(_following),
            ],
          ),
        ),
      ),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 3,
    );
  }

  final _feed = <WordPair>[];
  final _story = <WordPair>[];
  final _followers = <WordPair>[];
  final _following = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildList(list) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= list.length) {
            list.addAll(generateWordPairs().take(10));
          }
          return _buildRow(list[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () => _showToast(pair.asPascalCase),
    );
  }
}
