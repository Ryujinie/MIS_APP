// import 'package:flutter/material.dart';
// import 'package:ssi_mis_flutter/config/constants.dart' as constants;
// import 'package:ssi_mis_flutter/global/buttons/status_declined_button.dart';
// import 'package:ssi_mis_flutter/global/buttons/status_for_final_approval_button.dart';
// import 'package:ssi_mis_flutter/global/buttons/status_for_approval_button.dart';
// import 'package:ssi_mis_flutter/global/buttons/status_approved_button.dart';
// import 'package:intl/intl.dart';
// import 'package:ssi_mis_flutter/global/modals/admin_view_otrequest_modal.dart';

// class AdminOTRequestRecords extends StatelessWidget {
//   const AdminOTRequestRecords({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: constants.adminBG,
//       height: double.infinity,
//       child: Column(
//         children: [
//           //
//           const SizedBox(
//             height: 0,
//           ),

//           //============================ Action Buttons ============================

//           //========================== Table ==========================
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(0.0), // Set left top radius
//                   topRight: Radius.circular(0.0), // Set top right radius
//                   bottomRight: Radius.circular(20), // Set bottom right radius
//                   bottomLeft: Radius.circular(20), // Set bottom left radius
//                 ),
//                 color: constants.adminTable,
//               ),
//               child: SingleChildScrollView(
//                   child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // =================== Data table ====================
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(
//                             label: Flexible(
//                                 child: Center(child: Text('Employee ID')))),
//                         DataColumn(
//                             label: Flexible(
//                                 child: Center(child: Text('Employee Name')))),
//                         DataColumn(
//                             label:
//                                 Flexible(child: Center(child: Text('From')))),
//                         DataColumn(
//                             label: Flexible(child: Center(child: Text('To')))),
//                         DataColumn(
//                             label: Flexible(
//                                 child: Center(child: Text('Start Time')))),
//                         DataColumn(
//                             label: Flexible(
//                                 child: Center(child: Text('End Time')))),
//                         DataColumn(
//                             label:
//                                 Flexible(child: Center(child: Text('Hours')))),
//                         DataColumn(
//                             label:
//                                 Flexible(child: Center(child: Text('Status')))),
//                         DataColumn(
//                             label:
//                                 Flexible(child: Center(child: Text('Action')))),
//                       ],
//                       rows: overtimeRequest.map((oTRequests) {
//                         return DataRow(cells: [
//                           DataCell(Center(
//                               child: Text(oTRequests.employeeID.toString()))),
//                           DataCell(
//                               Center(child: Text(oTRequests.employeeName))),
//                           DataCell(Center(
//                               child: Text(DateFormat('MM/dd/yyyy')
//                                   .format(oTRequests.from)
//                                   .toString()))),
//                           DataCell(Center(
//                               child: Text(DateFormat('MM/dd/yyyy')
//                                   .format(oTRequests.to)
//                                   .toString()))),
//                           DataCell(Center(
//                             child: Text(DateFormat('h:mm a')
//                                 .format(oTRequests.starttime)
//                                 .toString()),
//                           )),
//                           DataCell(Center(
//                             child: Text(DateFormat('h:mm a')
//                                 .format(oTRequests.endtime)
//                                 .toString()),
//                           )),
//                           DataCell(Center(child: Text(oTRequests.hours))),
//                           DataCell(Center(child: oTRequests.remarks)),
//                           const DataCell(Center(
//                               child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               ViewOTRequest(),
//                             ],
//                           ))),
//                         ]);
//                       }).toList(),
//                       headingTextStyle: Theme.of(context).textTheme.titleMedium,
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OTRequest {
//   final String employeeID;
//   final String employeeName;
//   final DateTime from;
//   final DateTime to;
//   final DateTime starttime;
//   final DateTime endtime;
//   final String hours;
//   final Widget remarks;

//   const OTRequest({
//     required this.employeeID,
//     required this.employeeName,
//     required this.from,
//     required this.to,
//     required this.starttime,
//     required this.endtime,
//     required this.hours,
//     required this.remarks,
//   });
// }

// final List<OTRequest> overtimeRequest = [
//   OTRequest(
//     employeeID: 'EMP001',
//     employeeName: 'John Doe',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime.now(),
//     endtime: DateTime.now(),
//     hours: '1.5',
//     remarks: const StatusApproved(),
//   ),
//   OTRequest(
//     employeeID: 'EMP002',
//     employeeName: 'Jane Smith',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '3',
//     remarks: const StatusForApproval(),
//   ),
//   OTRequest(
//     employeeID: 'EMP003',
//     employeeName: 'Michael Lee',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '4',
//     remarks: const StatusForFinalApproval(),
//   ),
//   OTRequest(
//     employeeID: 'EMP004',
//     employeeName: 'Olivia Jones',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '5',
//     remarks: const StatusDeclined(),
//   ),
//   OTRequest(
//     employeeID: 'EMP005',
//     employeeName: 'David Garcia',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '7',
//     remarks: const StatusDeclined(),
//   ),
//   OTRequest(
//     employeeID: 'EMP006',
//     employeeName: 'Emily Williams',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '13',
//     remarks: const StatusApproved(),
//   ),
//   OTRequest(
//     employeeID: 'EMP007',
//     employeeName: 'Charles Brown',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '5',
//     remarks: const StatusForApproval(),
//   ),
//   OTRequest(
//     employeeID: 'EMP008',
//     employeeName: 'Amanda Miller',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '3.5',
//     remarks: const StatusForFinalApproval(),
//   ),
//   OTRequest(
//     employeeID: 'EMP009',
//     employeeName: 'Robert Davis',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 4, 8),
//     endtime: DateTime(2024, 04, 08),
//     hours: '24',
//     remarks: const StatusApproved(),
//   ),
//   OTRequest(
//     employeeID: 'EMP010',
//     employeeName: 'Catherine Wilson',
//     from: DateTime.now(),
//     to: DateTime.now(),
//     starttime: DateTime(2024, 04, 08),
//     endtime: DateTime(2024, 04, 08),
//     hours: '4',
//     remarks: const StatusForApproval(),
//   ),
// ];
