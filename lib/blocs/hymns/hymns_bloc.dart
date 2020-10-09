import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_church/blocs/hymns/hymns.dart';
import 'package:the_church/models/models.dart';
import 'package:the_church/repositories/hymns_repository.dart';

class HymnsBloc extends Bloc<HymnsEvent, HymnsState> {
  final HymnsRepository hymnsRepository;

  HymnsBloc({@required this.hymnsRepository})
      : assert(hymnsRepository != null),
        super(HymnsLoadInProgress());

  @override
  Stream<HymnsState> mapEventToState(HymnsEvent event) async* {
    print('event is $event');
    if (event is HymnsLoaded) {
      yield* _mapHymnsLoadedToState();
    }
  }

  Stream<HymnsState> _mapHymnsLoadedToState() async* {
    try {
      print('loading hymns');
      final hymns = await this.hymnsRepository.loadHymns();
      print(hymns);
      yield HymnsLoadSuccess(
        hymns.map(Hymn.fromEntity).toList(),
      );
    } catch (e) {
      print(e.toString());
      yield HymnsLoadFailure();
    }
  }
}
