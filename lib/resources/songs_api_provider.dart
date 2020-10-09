import 'package:the_church/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:the_church/repositories/song_entity.dart';

class SongsApiProvider implements SongsRepository {
  final Duration delay;
  final Dio _dio = Dio();
  final String _endpoint = "https://spiritual-hymnals.herokuapp.com/api";

  SongsApiProvider([this.delay = const Duration(milliseconds: 3000)]);

  @override
  Future<List<SongEntity>> loadSongs(id) async {
    print('got here loading');
    try {
      Response<dynamic> res = await _dio.get('$_endpoint/hymn/$id/songs');
      final json = res.data['data'];
      print(json);
      final songs =
          (json).map<SongEntity>((song) => SongEntity.fromJson(song)).toList();
      return songs;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }
}
