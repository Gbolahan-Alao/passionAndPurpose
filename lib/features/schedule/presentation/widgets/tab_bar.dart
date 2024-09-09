import 'package:flutter/material.dart';
import 'tab_item.dart';

class ScheduleTabBar extends StatelessWidget {
  final int selectedTabIndex;
  final Function(int) onTabSelected;

  const ScheduleTabBar({
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TabItem(
              title: "Upcoming",
              isSelected: selectedTabIndex == 0,
              onTap: () => onTabSelected(0),
              screenWidth: screenWidth,
            ),
          ),
          Expanded(
            child: TabItem(
              title: "Completed",
              isSelected: selectedTabIndex == 1,
              onTap: () => onTabSelected(1),
              screenWidth: screenWidth,
            ),
          ),
          Expanded(
            child: TabItem(
              title: "Cancelled",
              isSelected: selectedTabIndex == 2,
              onTap: () => onTabSelected(2),
              screenWidth: screenWidth,
            ),
          ),
        ],
      ),
    );
  }
}
