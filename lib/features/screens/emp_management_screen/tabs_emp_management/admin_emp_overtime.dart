import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/modals/admin_view_otrequest_modal.dart';
import 'package:ssi_mis_flutter/global/printing/admin/print_overtime_admin.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== OVERTIME TAB - ADMIN EMP MNGMT =============== //
class OvertimeAdminEmp extends StatelessWidget {
  const OvertimeAdminEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
      decoration: const BoxDecoration(
        color: constants.hrTable,
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 28, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //===================== Search Employee ====================
                      //const SizedBox(width: 30.0),
                      CustomSearchBarFilter(
                        hintText: "Search Overtime...",
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PrintAdminOvertime();
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
            //AttendanceList(),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
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
