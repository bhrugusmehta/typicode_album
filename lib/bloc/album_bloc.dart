import 'dart:async';

import 'package:typicode_albums/model/album.dart';
import 'package:typicode_albums/service/db_service.dart';

class AlbumBloc {
  var _albums = <Album>[];
  final StreamController<List<Album>> _albumController = StreamController<List<Album>>();
  Stream<List<Album>> get albumStream => _albumController.stream;

  void fetchAlbums() async {
    _albums = await DBService.fetchAlbumList();
    _albumController.sink.add(_albums);
  }

  void dispose() {
    _albumController.close();
    _albums.clear();
  }
}

final albumBloc = AlbumBloc();