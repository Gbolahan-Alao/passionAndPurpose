import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:passion_purpose/core/theme/theme.dart';
import 'package:passion_purpose/features/schedule/data/appointment_data.dart';
import 'package:passion_purpose/features/schedule/presentation/widgets/cards/appointment_card.dart';
import 'package:passion_purpose/features/schedule/presentation/widgets/tab_bar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _selectedTabIndex = 0;

  String getAppointmentStatusByTabIndex(int index) {
    switch (index) {
      case 0:
        return 'upcoming';
      case 1:
        return 'completed';
      case 2:
        return 'cancelled';
      default:
        return 'upcoming';
    }
  }

  List<Appointment> getFilteredAppointments() {
    String status = getAppointmentStatusByTabIndex(_selectedTabIndex);
    return appointments
        .where((appointment) => appointment.appointmentStatus == status)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        title: const Text(
          'Schedule',
          textAlign: TextAlign.start,
          style: TextStyle(color: AppTheme.textColor),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/image-5.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      ScheduleTabBar(
                        selectedTabIndex: _selectedTabIndex,
                        onTabSelected: (int index) {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var appointment = getFilteredAppointments()[index];
                      return AppointmentCard(
                        title: appointment.title,
                        appointmentDate: appointment.appointmentDate,
                        appointmentTime: appointment.appointmentTime,
                        appointmentStatus: appointment.appointmentStatus,
                        doctorImageUrl: appointment.doctorImageUrl,
                      );
                    },
                    childCount: getFilteredAppointments().length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
