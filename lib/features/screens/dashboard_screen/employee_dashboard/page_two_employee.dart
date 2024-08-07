import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/employee_dashboard/attendance_emp_dashboard_data.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/employee_dashboard/holidays_emp_dashboard_data.dart';

// =============== Employee Dashboard Bottom Cards =============== //
class EmployeeDashPage2 extends StatelessWidget {
  const EmployeeDashPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(220, 0, 200, 30),
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                      color: constants.mainTextWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                '   Pay Schedule',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                ],
              ),
              const SizedBox(width: 300),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: 400,
                      decoration: BoxDecoration(
                        color: constants.mainTextWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  '   Upcoming Holidays',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 0),
                            DataTable(
                              dividerThickness: 0.5,
                              columnSpacing: 50,
                              headingRowHeight: 20,
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    '',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    '',
                                  ),
                                ),
                              ],
                              rows: upcomingHolidays.map(
                                (upcomingHolidays) {
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              upcomingHolidays.holidayName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                            ),
                                            Text(
                                              upcomingHolidays.holidayType,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Center(
                                                child: Text(
                                                  upcomingHolidays.holidayDate,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: constants.empBtn),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    upcomingHolidays.holidayDay,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: constants
                                                              .mainTextGrey,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    const SizedBox(height: 0),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: 440,
                      decoration: BoxDecoration(
                        color: constants.mainTextWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  '   Attendance History',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Show all',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.empBtn,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: constants.adminBG),
                                    child: DataTable(
                                      columnSpacing: 40,
                                      dividerThickness: 0.1,
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: constants.mainTextGrey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: constants.mainTextGrey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: constants.mainTextGrey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: constants.mainTextGrey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                      ],
                                      rows: const [],
                                    ),
                                  ),
                                ),
                                DataTable(
                                  dividerThickness: 0.5,
                                  columnSpacing: 15,
                                  columns: const [
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Date',
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Time in',
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Time out',
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Center(
                                        child: Text(
                                          'Effective Time',
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: attendanceHistory.map(
                                    (attendanceHistory) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            attendanceHistory.dateHistory ==
                                                    'Today'
                                                ? Text(
                                                    'Today',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color:
                                                              constants.empBtn,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  )
                                                : Text(
                                                    attendanceHistory
                                                        .dateHistory,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: constants
                                                              .mainTextGrey,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  ),
                                          ),
                                          DataCell(
                                            Text(
                                              attendanceHistory.timeInHistory,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                            ),
                                          ),
                                          DataCell(
                                            attendanceHistory.timeOutHistory ==
                                                    'Still timed in'
                                                ? Text(
                                                    'Still timed in',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color:
                                                              constants.empBtn,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  )
                                                : Text(
                                                    attendanceHistory
                                                        .timeOutHistory,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: constants
                                                              .mainTextGrey,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                  ),
                                          ),
                                          DataCell(
                                            Column(
                                              children: [
                                                Text(
                                                  attendanceHistory
                                                      .effectiveTime,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                ),
                                                Text(
                                                  attendanceHistory
                                                      .effectiveTime2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: constants
                                                            .mainTextGrey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
              const SizedBox(width: 0),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
