// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/modals/hr_view_attendance_modal.dart';
import 'package:ssi_mis_flutter/global/printing/admin/print_attendance_admin.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== ATTENDANCE TAB - ADMIN EMP MNGMT =============== //
class AttendanceAdmin extends StatefulWidget {
  const AttendanceAdmin({super.key});

  @override
  State<AttendanceAdmin> createState() => _AttendanceAdminState();
}

class _AttendanceAdminState extends State<AttendanceAdmin> {
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
      decoration: const BoxDecoration(
        color: constants.hrTable,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 20, 48, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const CustomSearchBarFilter(
                    hintText: "Search Attendance...",
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintAdminAttendance();
                        }),
                    color: constants.adminBtn,
                    label: Column(
                      children: [
                        const SizedBox(height: 2.5),
                        Row(
                          children: [
                            const Icon(
                              Icons.print,
                              color: constants.mainTextWhite,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Print Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextWhite,
                                    //fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2.5),
                      ],
                    ),
                    borderRadius: 8,
                  ),
                  const SizedBox(width: 50),
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

                  //DISABLED Report
                  // DataColumn(
                  //   label: Flexible(
                  //     child: Center(
                  //       child: Text(
                  //         'Report',
                  //         style: heading,
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
                rows: attendanceRecord.map((attendance) {
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
                          DateFormat.jm().format(attendance.timeIn).toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //Time out
                    DataCell(
                      Center(
                        child: Text(
                          DateFormat.jm().format(attendance.timeOut).toString(),
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

                    //DISABLED Report
                    // DataCell(
                    //   Center(
                    //     child: AttachedButton(
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),

                    //Hours Rendered
                    DataCell(
                      Center(
                        child: Text(
                          attendance.hrsRendered.toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //Action
                    const DataCell(
                      Center(
                        child: ViewAttendance(),
                      ),
                    ),
                  ]);
                }).toList(),
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String selectedValue = "id";

// ========================== Sample Dropdown Data ==========================
List<DropdownMenuItem<String>> get filterDropdown {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "id", child: Text("ID")),
    const DropdownMenuItem(value: "date", child: Text("Date")),
    const DropdownMenuItem(value: "status", child: Text("Status")),
  ];
  return menuItems;
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
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
];

class AttachedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AttachedButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: const Icon(
          Icons.description_rounded,
          color: constants.lightGray,
          size: 22,
        ),
      ),
      //),
    );
  }
}
