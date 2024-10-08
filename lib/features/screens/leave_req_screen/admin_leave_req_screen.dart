import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_for_approval.dart';
import 'package:ssi_mis_flutter/global/buttons/status_declined.dart';
import 'package:ssi_mis_flutter/global/buttons/status_final_approval.dart';
import 'package:ssi_mis_flutter/global/modals/admin_leavereq_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_viewleave_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class AdminLeaveReqScreen extends StatelessWidget {
  const AdminLeaveReqScreen({super.key});

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
                    //=============== Search Employee ===============
                    CustomSearchBar(hintText: 'Search Employee'),

                    SizedBox(width: 4),

                    // =============== Date Filter ================
                    DateFilter(),
                  ],
                ),

                // =============== Create Leave ================
                CustomElevatedButton(
                  onPressed: () {
                    createLeave(context);
                  },
                  color: constants.adminBtnGreen,
                  borderRadius: 8,
                  label: const Text(
                    "Create Leave",
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
                                    'Type of Leave',
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
                                    'Start Date',
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
                                    'End Date',
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
                                  //Emp ID
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

                                  // ========== Emp Name ============
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 150,
                                        child: Text(
                                          leave.empName,
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

                                  // ============== Type of Leave =============
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 150,
                                        child: Text(
                                          leave.type,
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

                                  // ============= Start Date ==============
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

                                  // ============== End Date =============
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
                                          ViewLeave(),
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
    empName: "Kang Haerin",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 04, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Kim Dahyun",
    type: "Maternity Leave",
    startDate: DateTime(2024, 04, 03, 8, 30),
    endDate: DateTime(2024, 04, 05, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Lee Hyein",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 01, 8, 30),
    endDate: DateTime(2024, 04, 03, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Casey Luong",
    type: "Administrative Leave",
    startDate: DateTime(2024, 05, 03, 8, 30),
    endDate: DateTime(2024, 05, 04, 18, 30),
    status: const StatusApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Lukas Chiang",
    type: "Sick Leave",
    startDate: DateTime(2024, 05, 21, 8, 30),
    endDate: DateTime(2024, 05, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
  Leave(
    empID: 12345,
    empName: "Frank Ocean",
    type: "Paternity Leave",
    startDate: DateTime(2024, 02, 13, 8, 30),
    endDate: DateTime(2024, 02, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Kim Chae-won",
    type: "Vacation Leave",
    startDate: DateTime(2024, 01, 12, 8, 30),
    endDate: DateTime(2024, 01, 14, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Son Chae-young",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 17, 8, 30),
    endDate: DateTime(2024, 04, 18, 18, 30),
    status: const StatusApproved(),
  ),
  Leave(
    empID: 12345,
    empName: "Lee Sung-kyung",
    type: "Emergency Leave",
    startDate: DateTime(2024, 04, 13, 8, 30),
    endDate: DateTime(2024, 04, 15, 18, 30),
    status: const StatusDeclined(),
  ),
  Leave(
    empID: 12345,
    empName: "Lee Ji-eun",
    type: "Vacation Leave",
    startDate: DateTime(2024, 04, 21, 8, 30),
    endDate: DateTime(2024, 04, 23, 18, 30),
    status: const StatusFinalApproval(),
  ),
];
