import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/tab/tab_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/tab/tab_event.dart';
import 'package:flutter_bloc_boiler_plate/models/models.dart';
import 'package:flutter_bloc_boiler_plate/screens/hymn_item.dart';
import 'package:flutter_bloc_boiler_plate/widgets/tab_selector.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 4.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: 4.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: (activeTab == AppTab.home)
            ? HymnList()
            : (activeTab == AppTab.favourite) ? null : null,
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected: (tab) =>
              BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
        ),
      );
    });
  }
}
