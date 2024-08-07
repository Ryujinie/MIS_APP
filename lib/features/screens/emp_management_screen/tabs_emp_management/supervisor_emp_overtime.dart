import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/modals/admin_view_otrequest_modal.dart';
import 'package:ssi_mis_flutter/global/printing/supervisor/print_overtime_supervisor.dart';

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

// =============== OVERTIME TAB - ADMIN EMP MNGMT =============== //
class SupervisorEmpOvertime extends StatelessWidget {
  const SupervisorEmpOvertime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
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
                        return const PrintSupervisorOvertime();
                      }),
                  color: constants.supervisorPrimary,
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
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0), // Set left top radius
                    topRight: Radius.circular(0.0), // Set top right radius
                    bottomRight: Radius.circular(20), // Set bottom right radius
                    bottomLeft: Radius.circular(20), // Set bottom left radius
                  ),
                  color: constants.adminTable,
                ),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // =================== Data table ====================
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
                      child: DataTable(
                        columns: const [
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Employee ID')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Employee Name')))),
                          DataColumn(
                              label:
                                  Flexible(child: Center(child: Text('From')))),
                          DataColumn(
                              label:
                                  Flexible(child: Center(child: Text('To')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Start Time')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('End Time')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Hours')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Status')))),
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Action')))),
                        ],
                        rows: overtimeRequest.map((oTRequests) {
                          return DataRow(cells: [
                            DataCell(Center(
                                child: Text(oTRequests.employeeID.toString()))),
                            DataCell(
                                Center(child: Text(oTRequests.employeeName))),
                            DataCell(Center(
                                child: Text(DateFormat('MM/dd/yyyy')
                                    .format(oTRequests.from)
                                    .toString()))),
                            DataCell(Center(
                                child: Text(DateFormat('MM/dd/yyyy')
                                    .format(oTRequests.to)
                                    .toString()))),
                            DataCell(Center(
                              child: Text(DateFormat('h:mm a')
                                  .format(oTRequests.starttime)
                                  .toString()),
                            )),
                            DataCell(Center(
                              child: Text(DateFormat('h:mm a')
                                  .format(oTRequests.endtime)
                                  .toString()),
                            )),
                            DataCell(Center(child: Text(oTRequests.hours))),
                            DataCell(Center(child: oTRequests.remarks)),
                            const DataCell(Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ViewOTRequest(),
                              ],
                            ))),
                          ]);
                        }).toList(),
                        headingTextStyle:
                            Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OTRequest {
  final String employeeID;
  final String employeeName;
  final DateTime from;
  final DateTime to;
  final DateTime starttime;
  final DateTime endtime;
  final String hours;
  final Widget remarks;

  const OTRequest({
    required this.employeeID,
    required this.employeeName,
    required this.from,
    required this.to,
    required this.starttime,
    required this.endtime,
    required this.hours,
    required this.remarks,
  });
}

final List<OTRequest> overtimeRequest = [
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime.now(),
    endtime: DateTime.now(),
    hours: '1.5',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3',
    remarks: const StatusApproval(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusFinalApproval(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusDeclined(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '7',
    remarks: const StatusDeclined(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '13',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusApproval(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3.5',
    remarks: const StatusFinalApproval(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 4, 8),
    endtime: DateTime(2024, 04, 08),
    hours: '24',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'Gracie Gates',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusApproval(),
  ),
];
