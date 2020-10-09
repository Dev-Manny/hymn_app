import 'package:flutter/material.dart';
import 'package:the_church/repositories/repository.dart';

class LocalStorageRepository implements HymnsRepository {
  final HymnsRepository localStorage;
  final HymnsRepository webClient;

  const LocalStorageRepository({
    @required this.localStorage,
    this.webClient,
  });

  @override
  Future<List<HymnEntity>> loadHymns() async {
    try {
      print('local');
      return await localStorage.loadHymns();
    } catch (e) {
      print('web');
      final hymns = await webClient.loadHymns();
      await localStorage.saveHymns(hymns);
      return hymns;
    }
  }

  // Persists hymns to local disk and the web
  @override
  Future saveHymns(List<HymnEntity> hymns) {
    print('save hymns');
    return Future.wait<dynamic>(
        [localStorage.saveHymns(hymns), webClient.saveHymns(hymns)]);
  }
}
