import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/status_present_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_late_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_absent_button.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/modals/supervisor_attendance_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class SupervisorAttendanceScreen extends StatelessWidget {
  const SupervisorAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 24),

          //=================== Search, Filter, Generate Buttons ===================
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //=============== Search Employee ===============
                    const CustomSearchBar(
                      hintText: "Search Attendance...",
                    ),

                    const SizedBox(width: 4),

                    // =============== Date Filter ================
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: constants.adminFilter,
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.all(8),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: constants.darkGray,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                //=================== Generate Button ===================
                CustomElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const SupervisorAttendanceModal();
                    },
                  ),
                  color: constants.supervisorBtn,
                  borderRadius: 8,
                  label: const Text(
                    "Generate",
                    style: TextStyle(
                      fontSize: 14,
                      color: constants.mainTextWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // =================== Data table ====================
                      Padding(
                        padding: const EdgeInsets.fromLTRB(48, 12, 48, 24),
                        child: DataTable(
                          // ================= Column =================
                          columns: [
                            //Employee
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Employee',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
                                  ),
                                ),
                              ),
                            ),

                            //Department
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Department',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
                                  ),
                                ),
                              ),
                            ),

                            //Date
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: constants.mainTextBlack),
                                  ),
                                ),
                              ),
                            ),

                            //Action Button
                            // DataColumn(
                            //   label: Flexible(
                            //     child: Center(
                            //       child: Text(
                            //         'Action',
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .titleMedium
                            //             ?.copyWith(
                            //                 color: constants.mainTextBlack),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],

                          // ================= Rows =================
                          rows: attendanceRecord.map(
                            (attendance) {
                              return DataRow(
                                cells: [
                                  //EmpName
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 100,
                                        child: Text(
                                          attendance.empName,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Department
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 100,
                                        child: Text(
                                          attendance.department,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Date
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(attendance.date)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
                                      ),
                                    ),
                                  ),

                                  //Status
                                  DataCell(
                                    Center(child: attendance.status),
                                  ),

                                  //Hours Rendered
                                  DataCell(
                                    Center(
                                      child: Text(
                                        attendance.hrsRendered.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
                                      ),
                                    ),
                                  ),

                                  //Action Button
                                  // const DataCell(
                                  //   Center(
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         ViewAttendance(),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              );
                            },
                          ).toList(),
                          headingTextStyle:
                              Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
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

class Attendance {
  final String empName;
  final String department;
  final DateTime date;
  final DateTime timeIn;
  final DateTime timeOut;
  final Widget status;
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
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusLate(),
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusAbsent(),
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusLate(),
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusAbsent(),
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusLate(),
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusAbsent(),
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Sasha White",
      department: "Accounting",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
  Attendance(
      empName: "Shin Ryujin",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusLate(),
      hrsRendered: 9),
  Attendance(
      empName: "Kang Haerin",
      department: "Marketing",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusAbsent(),
      hrsRendered: 9),
  Attendance(
      empName: "Bae Joohyun",
      department: "IT",
      date: DateTime(2024, 04, 03),
      timeIn: DateTime(2024, 04, 03, 8, 30),
      timeOut: DateTime(2024, 04, 03, 18, 30),
      status: const StatusPresent(),
      hrsRendered: 9),
];

// ========================== DateTime Picker ==========================
Future<void> _selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
  }
}
