import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_church/models/models.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //key: ArchSampleKeys.tabs,

      elevation: 8.0,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            (tab == AppTab.home)
                ? Icons.home
                : (tab == AppTab.favourite)
                    ? Icons.favorite_border
                    : Icons.menu,
            // key: tab == AppTab.home
            //     ? ArchSampleKeys.todoTab
            //     : ArchSampleKeys.statsTab,
          ),
          title: Text((tab == AppTab.home)
              ? 'Home'
              : (tab == AppTab.favourite) ? 'Favourite' : 'More'),
        );
      }).toList(),
    );
  }
}
