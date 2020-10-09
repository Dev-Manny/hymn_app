import 'package:the_church/repositories/song_entity.dart';

abstract class SongsRepository {
  Future<List<SongEntity>> loadSongs(int id);

  //Save to local storage
  //Future saveSongs(List<SongEntity> songs);
}
