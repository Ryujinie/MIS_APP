import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeeScheduleScreen extends StatefulWidget {
  const EmployeeScheduleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeScheduleScreenState createState() => _EmployeeScheduleScreenState();
}

class _EmployeeScheduleScreenState extends State<EmployeeScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: empBtn,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                // Day Container design ex. sun, mon, tue
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SfCalendar(
              view: CalendarView.month,

              showNavigationArrow: true,
              showDatePickerButton: true,
              cellBorderColor: Colors.grey,
              // Header
              headerHeight: 100.0,
              headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.left,
                backgroundColor: Colors.transparent,
                textStyle: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              // Day Container ex. sun, mon, tue
              viewHeaderStyle: const ViewHeaderStyle(
                dayTextStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto-Regular',
                  color: mainTextBlack,
                  height: 60,
                ),
              ),
              // Logic
              viewHeaderHeight: 60,
              monthViewSettings: const MonthViewSettings(
                dayFormat: 'EEE',
                showTrailingAndLeadingDates: true,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
              // Blackout Dates
              blackoutDatesTextStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough),
              monthCellBuilder: (context, details) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1.0), // Adding border here
                    color: Colors.white, // Optional: Set background color
                  ),
                  // Day Holder inside day cells
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        details.date.day.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      // Under the Day Cells
                      const Text(
                        '8:00 AM - 5:00 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
