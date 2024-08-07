import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/emp_accomplishment_report.dart';
import 'package:ssi_mis_flutter/global/modals/emp_view_accomp_report.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';

class EmployeeAttendanceScreen extends StatefulWidget {
  const EmployeeAttendanceScreen({super.key});

  @override
  State<EmployeeAttendanceScreen> createState() =>
      _EmployeeAttendanceScreenState();
}

class _EmployeeAttendanceScreenState extends State<EmployeeAttendanceScreen> {
  late DateTime clockedTime;
  bool timedIn = false;
  bool timedOut = false;
  bool isVisible = false;
  int index = 0;
  bool? isSubmitted = false;

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

    final TextStyle? buttonStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextWhite,
              fontWeight: FontWeight.w500,
            );

    return Container(
      color: constants.adminBG,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 24),

          // ============================= Time in/Time Out, Filter Buttons =============================
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),

            // ========================= Time in Row =========================
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ================= Display Time =================
                    Positioned(
                      left: index == 0 ? 80 : 95,

                      // Animation
                      child: AnimatedOpacity(
                        opacity: isVisible == true ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),

                        // Container
                        child: timedIn == true || timedOut == true
                            ? Container(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 12, 6),
                                decoration: BoxDecoration(
                                  color:
                                      constants.empFormFields.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),

                                // Time
                                child: Row(
                                  children: [
                                    const SizedBox(width: 2),
                                    Text(
                                      index == 1 ? 'timed in:' : 'timed out:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                          ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      DateFormat.jm()
                                          .format(clockedTime)
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),

                    // ================= Time In / Time Out Buttons =================
                    index == 0
                        ?
                        // Time In Button
                        CustomElevatedButton(
                            onPressed: () {
                              // Record Time In
                              setState(() {
                                clockedTime = DateTime.now();
                                timedIn = true;
                                isVisible = true;
                                index = 1;
                                isSubmitted = false; // remove pag may api na
                              });

                              // Display Time Visibility
                              Future.delayed(const Duration(seconds: 2), () {
                                if (mounted) {
                                  setState(() {
                                    isVisible = false;
                                  });
                                }
                              });
                            },

                            // Time In Label
                            label: Text(
                              'Time in',
                              style: buttonStyle,
                            ),
                            color: constants.empBtn,
                            borderRadius: 12)
                        :

                        // Time Out Button
                        CustomElevatedButton(
                            onPressed: () async {
                              //
                              // Accomplishment Report

                              // if report does not exist
                              if (isSubmitted == false) {
                                isSubmitted = await showDialog<bool>(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      const AccomplishmentReport(),
                                );

                                if (isSubmitted == true) {
                                  // Record Timeout

                                  setState(() {
                                    clockedTime = DateTime.now();
                                    timedOut = true;
                                    isVisible = true;
                                    index = 0;
                                  });

                                  //
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      if (mounted) {
                                        setState(() {
                                          isVisible = false;
                                        });
                                      }
                                    },
                                  );
                                }
                              }
                            },

                            // Time Out Label
                            label: Text(
                              'Time Out',
                              style: buttonStyle,
                            ),
                            color: constants.empBtnRed,
                            borderRadius: 12,
                          ),
                  ],
                ),

                // =============== Date Filter ================
                const DateFilter(),
              ],
            ),
          ),

          const SizedBox(height: 12),

          //========================== Table ==========================
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: constants.adminTable,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 12, 48, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                                        DateFormat.jm()
                                            .format(attendance.timeIn)
                                            .toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),

                                  //Time out
                                  DataCell(
                                    Center(
                                      child: Text(
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
                                              labelColor:
                                                  constants.mainTextWhite,
                                              width: 100,
                                            )
                                          : attendance.status == "late"
                                              ? const PillContainer(
                                                  color:
                                                      constants.hrstatusOrange,
                                                  label: "Late",
                                                  labelColor:
                                                      constants.mainTextWhite,
                                                  width: 100,
                                                )
                                              : attendance.status == "absent"
                                                  ? const PillContainer(
                                                      color:
                                                          constants.hrstatusRed,
                                                      label: "Absent",
                                                      labelColor: constants
                                                          .mainTextWhite,
                                                      width: 100,
                                                    )
                                                  : Container(),
                                    ),
                                  ),

                                  //Report
                                  DataCell(
                                    Center(
                                      child: ViewButton(
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const ViewAccomplishmentReport();
                                            }),
                                      ),
                                    ),
                                  ),

                                  //Hours Rendered
                                  DataCell(
                                    Center(
                                      child: Text(
                                        attendance.hrsRendered.toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ]);
                              })
                              .toList()
                              .reversed
                              .toList(),
                          headingTextStyle:
                              Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 04),
      timeIn: DateTime(2024, 04, 03, 10, 45),
      timeOut: DateTime(2024, 04, 03, 18, 00),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 05),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 06),
      timeIn: DateTime(2024, 04, 03, 8, 30),
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
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 08),
      timeIn: DateTime(2024, 04, 03, 9, 30),
      timeOut: DateTime(2024, 04, 03, 18, 00),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 09),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 10),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 11),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 12),
      timeIn: DateTime(2024, 04, 03, 10, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 13),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
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
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 16),
      timeIn: DateTime(2024, 04, 03, 11, 00),
      timeOut: DateTime(2024, 04, 03, 18, 00),
      status: "late",
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 17),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "absent",
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 18),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: "present",
      hrsRendered: 9),
];
