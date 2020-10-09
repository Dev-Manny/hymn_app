import 'package:the_church/repositories/repository.dart';
import 'package:dio/dio.dart';

class HymnsApiProvider implements HymnsRepository {
  final Duration delay;
  final Dio _dio = Dio();
  final String _endpoint = "https://spiritual-hymnals.herokuapp.com/api";

  HymnsApiProvider([this.delay = const Duration(milliseconds: 3000)]);

  @override
  Future<List<HymnEntity>> loadHymns() async {
    try {
      Response<dynamic> res = await _dio.get('$_endpoint/hymn/all');
      final json = res.data['data'];
      print(json);
      final hymns =
          (json).map<HymnEntity>((hymn) => HymnEntity.fromJson(hymn)).toList();
      print('my hymns');
      print(hymns);
      return hymns;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
    }
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  @override
  Future<bool> saveHymns(List<HymnEntity> hymns) async {
    return Future.value(true);
  }
}
