import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:the_church/blocs/tab/tab.dart';
import 'package:the_church/models/models.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.home);

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}
