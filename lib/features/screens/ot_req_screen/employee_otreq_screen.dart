import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/modals/employee_otreq_create_modal.dart';
import 'package:ssi_mis_flutter/global/modals/employee_otreqview_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';

class EmployeeOTRequestScreen extends StatelessWidget {
  const EmployeeOTRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 24),
          //============================ Action Buttons ============================
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    //
                    //================ Search Employee ================
                    CustomSearchBar(hintText: 'Search Request'),

                    SizedBox(width: 4),
                    //
                    // =============== Date Filter ================
                    DateFilter(),
                  ],
                ),
                //
                // =============== Create Leave ================
                CustomElevatedButton(
                  onPressed: () {
                    createOT(context);
                  },
                  color: constants.empBtn,
                  borderRadius: 8,
                  label: const Text(
                    "Create Request",
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
                    //
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
                                    'Request ID',
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
                            // =============== From ================
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

                            // ============= To =============
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
                          rows: leaveRecord.map(
                            (leave) {
                              return DataRow(
                                cells: [
                                  // Request ID
                                  DataCell(
                                    Center(
                                      child: Text(
                                        leave.reqid.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                    ),
                                  ),

                                  // DataCell(
                                  //   Center(
                                  //     child: Text(
                                  //       leave.to.toString(),
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyMedium
                                  //           ?.copyWith(
                                  //             color: constants.mainTextBlack,
                                  //           ),
                                  //     ),
                                  //   ),
                                  // ),

                                  // ========== From ============
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 70,
                                        child: Text(
                                          leave.from,
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

                                  // ============== To =============
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 150,
                                        child: Text(
                                          leave.to,
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

                                  // ============= Start Time ==============
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(leave.startDate)
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

                                  // ============== End Time =============
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(leave.endDate)
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
                                  //Hours
                                  DataCell(
                                    Center(
                                      child: Text(
                                        leave.hours.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                    ),
                                  ),

                                  // ========= Status ============
                                  DataCell(
                                    Center(child: leave.status),
                                  ),

                                  // =========== Actions ==========
                                  const DataCell(
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ViewOTRequest(),
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

//========================= Data Table ==========================
class Leave {
  final int reqid;
  final String from;
  final String to;
  final DateTime startDate;
  final DateTime endDate;
  final int hours;
  final Widget status;

  Leave({
    required this.reqid,
    required this.from,
    required this.to,
    required this.startDate,
    required this.endDate,
    required this.hours,
    required this.status,
  });
}

//============================== SAMPLE DATA FOR TABLE ==============================
final List<Leave> leaveRecord = [
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 04, 18, 30),
    status: const StatusFinalApproval(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 05, 18, 30),
    status: const StatusApproved(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 01, 8, 30),
    endDate: DateTime(2024, 04, 03, 18, 30),
    status: const StatusApproved(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 05, 03, 8, 30),
    endDate: DateTime(2024, 05, 04, 18, 30),
    status: const StatusApproval(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 05, 21, 8, 30),
    endDate: DateTime(2024, 05, 23, 18, 30),
    status: const StatusFinalApproval(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 02, 13, 8, 30),
    endDate: DateTime(2024, 02, 15, 18, 30),
    status: const StatusDeclined(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 01, 12, 8, 30),
    endDate: DateTime(2024, 01, 14, 18, 30),
    status: const StatusApproved(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 17, 8, 30),
    endDate: DateTime(2024, 04, 18, 18, 30),
    status: const StatusApproved(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 13, 8, 30),
    endDate: DateTime(2024, 04, 15, 18, 30),
    status: const StatusDeclined(),
    hours: 4,
  ),
  Leave(
    reqid: 12345,
    from: "08/21/24",
    to: "08/21/24",
    startDate: DateTime(2024, 04, 21, 8, 30),
    endDate: DateTime(2024, 04, 23, 18, 30),
    status: const StatusFinalApproval(),
    hours: 4,
  ),
];
