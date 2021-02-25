import 'package:flutter/material.dart';
import 'package:typicode_albums/screens/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album  list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Album list'),
        ),
        body: Center(
            child: AlbumList()
        ),
      ),
    );
  }
}


