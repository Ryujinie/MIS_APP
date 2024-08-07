// import 'package:flutter/material.dart';
// import 'package:ssi_mis_flutter/config/constants.dart' as constants;
// import 'package:ssi_mis_flutter/global/modals/admin_confirm_archive_modal.dart';
// import 'package:ssi_mis_flutter/global/modals/admin_department_update_modal.dart';
// import 'package:intl/intl.dart';

// class DepartmentRecord extends StatelessWidget {
//   const DepartmentRecord({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         color: constants.adminTable,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // =================== Data table ====================
//             DataTable(
//               // ============== Column Data ===============
//               columns: [
//                 //Department ID
//                 DataColumn(
//                   label: Flexible(
//                     child: Center(
//                       child: Text(
//                         'Department ID',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 //Name
//                 DataColumn(
//                   label: Flexible(
//                     child: Center(
//                       child: Text(
//                         'Department Name',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 //Date Created
//                 DataColumn(
//                   label: Flexible(
//                     child: Center(
//                       child: Text(
//                         'Date Created',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 //Action
//                 DataColumn(
//                   label: Flexible(
//                     child: Center(
//                       child: Text(
//                         'Action',
//                         style:
//                             Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],

//               // ============== Row Data ===============
//               rows: deptData.map(
//                 (deptData) {
//                   return DataRow(
//                     cells: [
//                       //ID
//                       DataCell(
//                         Center(
//                           child: Text(
//                             deptData.deptID.toString(),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                           ),
//                         ),
//                       ),

//                       //Department Name
//                       DataCell(
//                         Center(
//                           child: SizedBox(
//                             width: 150,
//                             child: Text(
//                               deptData.deptName,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium
//                                   ?.copyWith(
//                                     color: constants.mainTextBlack,
//                                   ),
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ),

//                       //Date Created
//                       DataCell(
//                         Center(
//                           child: Text(
//                             DateFormat('MM/dd/yyyy')
//                                 .format(deptData.dateCreated)
//                                 .toString(),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(
//                                   color: constants.mainTextBlack,
//                                 ),
//                           ),
//                         ),
//                       ),

//                       //Actions
//                       const DataCell(
//                         Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               DepartmentUpdate(),
//                               ConfirmArchive(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ).toList(),
//               headingTextStyle: Theme.of(context).textTheme.titleMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DepartmentData {
//   final int deptID;
//   final String deptName;
//   final DateTime dateCreated;

//   DepartmentData({
//     required this.deptID,
//     required this.deptName,
//     required this.dateCreated,
//   });
// }

// // ========================== Sample Table Data ==========================

// final List<DepartmentData> deptData = [
//   DepartmentData(
//     deptID: 0001,
//     deptName: "IT",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0002,
//     deptName: "Engineering",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0003,
//     deptName: "Human Resources",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0004,
//     deptName: "Admin",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0005,
//     deptName: "Accounting",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0006,
//     deptName: "Marketing",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0007,
//     deptName: "Design",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0008,
//     deptName: "QA",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
//   DepartmentData(
//     deptID: 0009,
//     deptName: "Business Development",
//     dateCreated: DateTime(2024, 04, 08),
//   ),
// ];
