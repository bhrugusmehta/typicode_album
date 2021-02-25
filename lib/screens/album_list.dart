

import 'package:flutter/material.dart';
import 'package:typicode_albums/bloc/album_bloc.dart';
import 'package:typicode_albums/model/album.dart';

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    albumBloc.fetchAlbums();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    albumBloc.dispose();
  }

  //This is for pagination
  //we can add more logic over here
  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      albumBloc.fetchAlbums();
    }
  }

  ListView _albumList(data) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _albumTile(data[index].albumTitle, data[index].userId);
        });
  }


//  ListView _albumList(data) {
//    return ListView.separated(
//        separatorBuilder: (context, index) {
//          return Divider();
//        },
//        itemCount: data.length,
//        itemBuilder: (context, index) {
//          return _albumTile(data[index].albumTitle, data[index].userId);
//        });
//  }

  //each list tile
  ListTile _albumTile(String title, String userId) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text("User ID: "+userId),

  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Album>>(
      stream: albumBloc.albumStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Album> data = snapshot.data;
          return _albumList(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Text("Loading albums...");
      },
    );
  }
}