import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/modals/admin_viewleave_modal.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/printing/manager/print_leave_manager.dart';

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

// =============== LEAVE TAB - ADMIN EMP MNGMT =============== //
class LeaveManagerEmp extends StatelessWidget {
  const LeaveManagerEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
      decoration: const BoxDecoration(
        color: constants.adminFilter,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 28, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //===================== Search Employee ====================
                      Container(
                        padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
                        height: 35,
                        width: 405,
                        decoration: BoxDecoration(
                          color: constants.adminFilter,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: constants.darkGray),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: constants.mainTextBlack),
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: constants.lightGray,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  isDense: true,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.search,
                                      color: constants.lightGray,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: const Icon(Icons.filter_alt_rounded),
                              iconSize: 24,
                              color: constants.lightGray,
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PrintManagerLeave();
                      }),
                  color: constants.mngrPrimary,
                  label: Column(
                    children: [
                      const SizedBox(height: 2.5),
                      Row(
                        children: [
                          const Icon(
                            Icons.print,
                            color: constants.mainTextBlack,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            'Print Details',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                  //fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.5),
                    ],
                  ),
                  borderRadius: 20,
                ),
                const SizedBox(width: 50),
              ],
            ),
            //AttendanceList(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Request ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Employee Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Type of Leave',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Start Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'End Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Status',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Action',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      rows: leaveRecord.map((leave) {
                        return DataRow(cells: [
                          DataCell(
                            Center(
                              child: Text(
                                leave.empID.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                    ),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(leave.empName),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(leave.type),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                DateFormat('MM/dd/yyyy')
                                    .format(leave.startDate)
                                    .toString(),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                DateFormat('MM/dd/yyyy')
                                    .format(leave.endDate)
                                    .toString(),
                              ),
                            ),
                          ),
                          DataCell(Center(child: leave.status)),
                          const DataCell(
                            Center(
                              child: ViewLeave(),
                            ),
                          ),
                        ]);
                      }).toList(),
                      headingTextStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

class Leave {
  final int empID;
  final String empName;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final Widget status;

  Leave({
    required this.empID,
    required this.empName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}

//============================== SAMPLE DATA FOR TABLE ==============================
final List<Leave> leaveRecord = [
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 04, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Maternity Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 05, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 01, 8, 30),
    endDate: DateTime(2024, 04, 03, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Administrative Leave",
    startDate: DateTime(2024, 05, 03, 8, 30),
    endDate: DateTime(2024, 05, 04, 18, 30),
    status: const StatusApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 05, 21, 8, 30),
    endDate: DateTime(2024, 05, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Paternity Leave",
    startDate: DateTime(2024, 02, 13, 8, 30),
    endDate: DateTime(2024, 02, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Vacation Leave",
    startDate: DateTime(2024, 01, 12, 8, 30),
    endDate: DateTime(2024, 01, 14, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 17, 8, 30),
    endDate: DateTime(2024, 04, 18, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Emergency Leave",
    startDate: DateTime(2024, 04, 13, 8, 30),
    endDate: DateTime(2024, 04, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Gracie Gates",
    type: "Vacation Leave",
    startDate: DateTime(2024, 04, 21, 8, 30),
    endDate: DateTime(2024, 04, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
];
