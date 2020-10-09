import 'package:equatable/equatable.dart';
import 'package:the_church/models/models.dart';

abstract class HymnsState extends Equatable {
  const HymnsState();

  @override
  List<Object> get props => [];
}

class HymnsLoadInProgress extends HymnsState {}

class HymnsLoadSuccess extends HymnsState {
  final List<Hymn> hymns;

  const HymnsLoadSuccess([this.hymns = const []]);

  @override
  List<Object> get props => [hymns];

  @override
  String toString() => 'HymnsLoadSucess { hymns: $hymns }';
}

class HymnsLoadFailure extends HymnsState {}
