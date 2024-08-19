import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/modals/hr_view_otrequest_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';

class HROTRequestScreen extends StatelessWidget {
  const HROTRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 24),
          //============================ Action Buttons ============================
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // ================ Search Tickets ================
                    CustomSearchBar(
                      hintText: "Search employee...",
                    ),
                    SizedBox(width: 4),
                    // =============== Date Filter ================
                    DateFilter(),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          //
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
                    // =================== Data table ====================
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(48, 12, 48, 24),
                        child: DataTable(
                          // ================= Column =================
                          columns: [
                            // =============== Employee ID =================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Employee ID',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            // =============== Name ================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Employee Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            // ============= Type of Leave =============
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'From',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            //===============   To    =======================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'To',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            // ================ Start Date =================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Start Time',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            // =============== End Date ===============
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'End Time',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            //=============== Hours ================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Hours',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            // ============== Status ===============
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Status',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),

                            // =============== Action ==================
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Action',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          //
                          // ============== Row Data ===============
                          rows: overtimeRequest.map(
                            (oTRequests) {
                              return DataRow(
                                cells: [
                                  //Emp ID
                                  DataCell(
                                    Center(
                                      child: Text(
                                        oTRequests.employeeID.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                    ),
                                  ),

                                  // ========== Employee Name ============
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 150,
                                        child: Text(
                                          oTRequests.employeeName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: constants.mainTextBlack,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // ============    From   ===============
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(oTRequests.from)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                    ),
                                  ),

                                  // ============    To   ===============
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(oTRequests.to)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                    ),
                                  ),

                                  // ============= Start Time ===============
                                  DataCell(Center(
                                    child: Text(DateFormat('h:mm a')
                                        .format(oTRequests.starttime)
                                        .toString()),
                                  )),
                                  //================ End Time =================
                                  DataCell(Center(
                                    child: Text(DateFormat('h:mm a')
                                        .format(oTRequests.endtime)
                                        .toString()),
                                  )),

                                  // ============== Hours =============
                                  DataCell(
                                      Center(child: Text(oTRequests.hours))),

                                  // ========= Remarks ============
                                  DataCell(
                                    Center(child: oTRequests.remarks),
                                  ),

                                  // =========== Actions ==========
                                  const DataCell(
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          HRViewOTRequest(),
                                        ],
                                      ),
                                    ),
                                  ),
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

// ========================== DateTime Picker ==========================

//========================= Data Table ==========================
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

//============================== SAMPLE DATA FOR TABLE ==============================
final List<OTRequest> overtimeRequest = [
  OTRequest(
    employeeID: 'EMP001',
    employeeName: 'John Doe',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime.now(),
    endtime: DateTime.now(),
    hours: '1.5',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP002',
    employeeName: 'Jane Smith',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3',
    remarks: const StatusFinalApproval(),
  ),
  OTRequest(
    employeeID: 'EMP003',
    employeeName: 'Michael Lee',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusFinalApproval(),
  ),
  OTRequest(
    employeeID: 'EMP004',
    employeeName: 'Olivia Jones',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusDeclined(),
  ),
  OTRequest(
    employeeID: 'EMP005',
    employeeName: 'David Garcia',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '7',
    remarks: const StatusDeclined(),
  ),
  OTRequest(
    employeeID: 'EMP006',
    employeeName: 'Emily Williams',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '13',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP007',
    employeeName: 'Charles Brown',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusApproval(),
  ),
  OTRequest(
    employeeID: 'EMP008',
    employeeName: 'Amanda Miller',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3.5',
    remarks: const StatusApproval(),
  ),
  OTRequest(
    employeeID: 'EMP009',
    employeeName: 'Robert Davis',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 4, 8),
    endtime: DateTime(2024, 04, 08),
    hours: '24',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP010',
    employeeName: 'Catherine Wilson',
    from: DateTime.now(),
    to: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusDeclined(),
  ),
];
