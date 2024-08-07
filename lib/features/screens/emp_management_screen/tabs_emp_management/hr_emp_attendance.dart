// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/tabs_emp_management/hr_emp_profile.dart';
import 'package:ssi_mis_flutter/global/buttons/attached_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/modals/admin_view_attendance.dart';
import 'package:ssi_mis_flutter/global/modals/hr_view_attendance_modal.dart';
import 'package:ssi_mis_flutter/global/printing/hr/print_attendance_hr.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== ATTENDANCE TAB - HR EMP MNGMT =============== //
class HREmpAttendance extends StatefulWidget {
  const HREmpAttendance({super.key});

  @override
  State<HREmpAttendance> createState() => _HREmpAttendanceState();
}

class _HREmpAttendanceState extends State<HREmpAttendance> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? bodyText = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: constants.mainTextBlack);

    final TextStyle? heading = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: constants.mainTextBlack);

    return Container(
      decoration: BoxDecoration(
        color: constants.hrTable.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ======================= Search Bar, Print Button ========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search Employee
                  const CustomSearchBar2(hintText: 'Search...'),

                  // Print Button
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintHrAttendance();
                        }),
                    color: constants.hrPrimary,
                    label: Row(
                      children: [
                        const Icon(
                          Icons.print,
                          color: constants.mainTextWhite,
                          size: 18,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          'Print Details',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.mainTextWhite,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    borderRadius: 20,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ============================ Data Table ==============================
              DataTable(
                // ================= Column Data =================
                columns: [
                  //Date
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Date',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Time in
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Time in',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Time out
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Time out',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Status
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Status',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Report
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Report',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Hours Rendered
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Hours Rendered',
                          style: heading,
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
                          style: heading,
                        ),
                      ),
                    ),
                  ),
                ],

                // ===================== Row Data =====================
                rows: attendanceRecord
                    .map((attendance) {
                      return DataRow(cells: [
                        //Date
                        DataCell(
                          Center(
                            child: Text(
                              DateFormat('MM/dd/yyyy')
                                  .format(attendance.date)
                                  .toString(),
                              style: bodyText,
                            ),
                          ),
                        ),

                        //Time in
                        DataCell(
                          Center(
                              child: Text(
                            // attendance.status == 'absent'
                            //     ? " "
                            //     :

                            DateFormat.jm()
                                .format(attendance.timeIn)
                                .toString(),
                            style: bodyText,
                          )),
                        ),

                        //Time out
                        DataCell(
                          Center(
                            child: Text(
                              // attendance.status == 'absent'
                              //     ? " "
                              //     :
                              DateFormat.jm()
                                  .format(attendance.timeOut)
                                  .toString(),
                              style: bodyText,
                            ),
                          ),
                        ),

                        //Status
                        DataCell(
                          Center(
                            child: attendance.status == "present"
                                ? const PillContainer(
                                    color: constants.hrstatusGreen,
                                    label: "Present",
                                    labelColor: constants.mainTextWhite,
                                    width: 100,
                                  )
                                : attendance.status == "late"
                                    ? const PillContainer(
                                        color: constants.hrstatusOrange,
                                        label: "Late",
                                        labelColor: constants.mainTextWhite,
                                        width: 100,
                                      )
                                    : attendance.status == "absent"
                                        ? const PillContainer(
                                            color: constants.hrstatusRed,
                                            label: "Absent",
                                            labelColor: constants.mainTextWhite,
                                            width: 100,
                                          )
                                        : Container(),
                          ),
                        ),

                        //Report
                        DataCell(
                          Center(
                            child: AttachedButton(
                              onPressed: () {},
                            ),
                          ),
                        ),

                        //Hours Rendered
                        DataCell(
                          Center(
                            child: Text(
                              // attendance.status == 'absent'
                              //     ? "0"
                              //     :
                              attendance.hrsRendered.toString(),
                              style: bodyText,
                            ),
                          ),
                        ),

                        //Action
                        const DataCell(
                          Center(
                            child: AdminViewAttendance(),
                          ),
                        ),
                      ]);
                    })
                    .toList()
                    .reversed
                    .toList(),
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================== Sample Table Data ==========================

class Attendance {
  final String empName;
  final String department;
  final DateTime date;
  final DateTime timeIn;
  final DateTime timeOut;
  final String status;
  final double hrsRendered;

  Attendance({
    required this.empName,
    required this.department,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.status,
    required this.hrsRendered,
  });
}

//============================== SAMPLE DATA FOR TABLE ==============================
final List<Attendance> attendanceRecord = [
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 10),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 10),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 04),
      timeIn: DateTime(2024, 04, 03, 8, 25),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 8),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 05),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 10),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 06),
      timeIn: DateTime(2024, 04, 03, 8, 45),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 07),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 10),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 08),
      timeIn: DateTime(2024, 04, 03, 10, 00),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 8),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 09),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 10),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 10),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 10),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 11),
      timeIn: DateTime(2024, 04, 03, 8, 50),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 10),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 12),
      timeIn: DateTime(2024, 04, 03, 9, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 8),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 13),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 10),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 14),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 15),
      timeIn: DateTime(2024, 04, 03, 8, 13),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 10),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 16),
      timeIn: DateTime(2024, 04, 03, 9, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 8),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 17),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 10),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 18),
      timeIn: DateTime(2024, 04, 03, 8, 45),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
];
