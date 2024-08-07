import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/manager_viewsched_modal.dart';

class ManagerSchedRecords extends StatelessWidget {
  const ManagerSchedRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: constants.adminTable,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =================== Data table ====================
            DataTable(
              // ============== Column Data ===============
              columns: [
                //Shift ID
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'ID',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Start Date
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Start Date',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //End Date
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'End Date',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Start Time
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Start Time',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //End Time
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'End Time',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Rest Day
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Rest Day',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Action
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Action',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),
              ],

              // ============== Row Data ===============
              rows: scheduleRecord.map(
                (schedule) {
                  return DataRow(
                    cells: [
                      //Emp ID
                      DataCell(
                        Center(
                          child: Text(
                            schedule.shiftID.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Start Date
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy')
                                .format(schedule.startDate)
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //End Date
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy')
                                .format(schedule.endDate)
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Start Time
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat.jm()
                                .format(schedule.startTime)
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //End Time
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat.jm().format(schedule.endTime).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Rest Day
                      DataCell(
                        Text(
                          schedule.restDay.join(", "),
                        ),
                      ),

                      //Actions
                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ViewButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ManagerViewSchedule();
                                    }),
                              ),
                              // ArchiveButton(
                              //   onPressed: () => showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return const ConfirmArchive();
                              //     },
                              //   ),
                              // ),
                              // const ConfirmArchive(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
              headingTextStyle: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class Schedule {
  final int shiftID;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> restDay;

  Schedule({
    required this.shiftID,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.restDay,
  });
}

// ========================== Sample Table Data ==========================

final List<Schedule> scheduleRecord = [
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 04, 01),
    endDate: DateTime(2024, 04, 30),
    startTime: DateTime(2024, 04, 01, 9, 00),
    endTime: DateTime(2024, 04, 30, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 05, 01),
    endDate: DateTime(2024, 05, 31),
    startTime: DateTime(2024, 05, 01, 6, 00),
    endTime: DateTime(2024, 05, 31, 15, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 06, 01),
    endDate: DateTime(2024, 06, 30),
    startTime: DateTime(2024, 06, 01, 8, 00),
    endTime: DateTime(2024, 06, 31, 17, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 409012,
    startDate: DateTime(2024, 07, 01),
    endDate: DateTime(2024, 07, 20),
    startTime: DateTime(2024, 07, 01, 7, 00),
    endTime: DateTime(2024, 07, 20, 16, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 07, 21),
    endDate: DateTime(2024, 07, 30),
    startTime: DateTime(2024, 07, 21, 8, 00),
    endTime: DateTime(2024, 07, 30, 17, 00),
    restDay: ["Sunday", "Monday"],
  ),
  Schedule(
    shiftID: 409012,
    startDate: DateTime(2024, 08, 01),
    endDate: DateTime(2024, 08, 17),
    startTime: DateTime(2024, 08, 01, 9, 00),
    endTime: DateTime(2024, 08, 20, 18, 00),
    restDay: ["Sunday", "Monday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 08, 17),
    endDate: DateTime(2024, 08, 31),
    startTime: DateTime(2024, 08, 21, 9, 00),
    endTime: DateTime(2024, 08, 31, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 09, 01),
    endDate: DateTime(2024, 09, 30),
    startTime: DateTime(2024, 09, 01, 9, 00),
    endTime: DateTime(2024, 09, 30, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 10, 01),
    endDate: DateTime(2024, 10, 31),
    startTime: DateTime(2024, 10, 01, 6, 00),
    endTime: DateTime(2024, 10, 31, 15, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 11, 01),
    endDate: DateTime(2024, 11, 30),
    startTime: DateTime(2024, 11, 01, 9, 00),
    endTime: DateTime(2024, 11, 30, 18, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 12, 01),
    endDate: DateTime(2024, 12, 31),
    startTime: DateTime(2024, 12, 01, 6, 00),
    endTime: DateTime(2024, 12, 31, 15, 00),
    restDay: ["Sunday", "Monday"],
  ),
];
