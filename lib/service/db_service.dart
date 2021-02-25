import 'package:dio/dio.dart';
import 'package:typicode_albums/model/album.dart';

class DBService {
  static String _albumUrl = "https://jsonplaceholder.typicode.com/albums";

  static Future<List<Album>> fetchAlbumList() async   {
     try {
        Response response;
        Dio dio = new Dio();

        response = await dio.get(_albumUrl);
//        print("get_albums:${response.data}");
        if (response.statusCode == 200) {
          try {
            if(response.data == null)
              return null;
//            print("data: ${response.data}");
            return (response.data as List).map((data) => Album.fromJson(data)).toList();
          } catch (error, stacktrace) {
            throw Exception("Exception occured: $error stackTrace: $stacktrace");
          }
        }
      } on DioError catch(e) {
        print("[ Error = ${e.request.path} - ${e.message}");
      }
      return null;
  }

}