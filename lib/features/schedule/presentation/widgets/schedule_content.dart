import 'package:flutter/material.dart';

class ScheduleContent extends StatelessWidget {
  final int selectedTabIndex;

  const ScheduleContent({required this.selectedTabIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _getTabContent(selectedTabIndex),
    );
  }

  Widget _getTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return _buildUpcomingSchedules();
      case 1:
        return _buildCompletedSchedules();
      case 2:
        return _buildCancelledSchedules();
      default:
        return Container();
    }
  }

  // Placeholder for Upcoming Schedules
  Widget _buildUpcomingSchedules() {
    return Center(
      child: Text("Upcoming Appointments"),
    );
  }

  // Placeholder for Completed Schedules
  Widget _buildCompletedSchedules() {
    return Center(
      child: Text("Completed Appointments"),
    );
  }

  // Placeholder for Cancelled Schedules
  Widget _buildCancelledSchedules() {
    return Center(
      child: Text("Cancelled Appointments"),
    );
  }
}
