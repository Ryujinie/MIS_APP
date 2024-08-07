import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/modals/hr_viewleave_modal.dart';
import 'package:ssi_mis_flutter/global/printing/hr/print_leave_hr.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== ATTENDANCE TAB - ADMIN EMP MNGMT =============== //
class HREmpLeave extends StatefulWidget {
  const HREmpLeave({super.key});

  @override
  State<HREmpLeave> createState() => _HREmpLeaveState();
}

class _HREmpLeaveState extends State<HREmpLeave> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? body = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: constants.mainTextBlack,
        );

    final TextStyle? heading = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: constants.mainTextBlack);
    return Container(
      decoration: BoxDecoration(
        color: constants.adminFilter.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //======================= Search Bar, Print Button ========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Search Employee
                  const CustomSearchBar2(hintText: 'Search...'),

                  // Print Button
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintHrLeave();
                        }),
                    color: constants.hrPrimary,
                    label: Row(
                      children: [
                        const Icon(
                          Icons.print,
                          color: constants.mainTextWhite,
                          size: 18,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          'Print Details',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.mainTextWhite,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    borderRadius: 20,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ============================ Data Table ==============================
              DataTable(
                // ============== Column Data ===============
                columns: [
                  //Request ID
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Request ID',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Type of Leave
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Type of Leave',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Start Date
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Start Date',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //End Date
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'End Date',
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

                  //Action
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Action',
                          style: heading,
                        ),
                      ),
                    ),
                  ),
                ],

                // ============== Row Data ===============
                rows: leaveRecord.map(
                  (leave) {
                    return DataRow(
                      cells: [
                        //Request ID
                        DataCell(
                          Center(
                            child: Text(
                              leave.requestID.toString(),
                              style: body,
                            ),
                          ),
                        ),

                        //Type of Leave
                        DataCell(
                          Center(
                            child: SizedBox(
                              width: 130,
                              child: Text(
                                leave.type,
                                style: body,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        //Start Date
                        DataCell(
                          Center(
                            child: Text(
                              DateFormat('MM/dd/yyyy')
                                  .format(leave.startDate)
                                  .toString(),
                              style: body,
                            ),
                          ),
                        ),

                        //End Date
                        DataCell(
                          Center(
                            child: Text(
                              DateFormat('MM/dd/yyyy')
                                  .format(leave.endDate)
                                  .toString(),
                              style: body,
                            ),
                          ),
                        ),

                        //Status
                        DataCell(
                          Center(
                            child: leave.status == "Approved"
                                ? const PillContainer(
                                    color: constants.hrstatusGreen,
                                    label: "Approved",
                                    labelColor: constants.mainTextWhite,
                                    width: 130,
                                  )
                                : leave.status == "For Approval"
                                    ? const PillContainer(
                                        color: constants.hrstatusBlue,
                                        label: "For Approval",
                                        labelColor: constants.mainTextWhite,
                                        width: 130,
                                      )
                                    : leave.status == "For Final Approval"
                                        ? const PillContainer(
                                            color: constants.hrstatusOrange,
                                            label: "For Final Approval",
                                            labelColor: constants.mainTextWhite,
                                            width: 130,
                                          )
                                        : leave.status == "Decline"
                                            ? const PillContainer(
                                                color: constants.hrstatusRed,
                                                label: "Decline",
                                                labelColor:
                                                    constants.mainTextWhite,
                                                width: 130,
                                              )
                                            : Container(),
                          ),
                        ),

                        //Action
                        const DataCell(
                          Center(
                            child: HRViewLeave(),
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Leave {
  final int requestID;
  final String empName;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  Leave({
    required this.requestID,
    required this.empName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}

final List<Leave> leaveRecord = [
  Leave(
    requestID: 12345,
    empName: "Kang Haerin",
    type: "Vacation Leave",
    startDate: DateTime(2024, 08, 03, 8, 30),
    endDate: DateTime(2024, 08, 10, 18, 30),
    status: 'For Approval',
  ),
  Leave(
    requestID: 12345,
    empName: "Kang Haerin",
    type: "Sick Leave",
    startDate: DateTime(2024, 06, 02, 8, 30),
    endDate: DateTime(2024, 06, 05, 18, 30),
    status: 'For Final Approval',
  ),
  Leave(
    requestID: 12347,
    empName: "Lee Hyein",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 01, 8, 30),
    endDate: DateTime(2024, 04, 03, 18, 30),
    status: 'Approved',
  ),
  Leave(
    requestID: 12352,
    empName: "Son Chae-young",
    type: "Sick Leave",
    startDate: DateTime(2024, 04, 17, 8, 30),
    endDate: DateTime(2024, 04, 18, 18, 30),
    status: 'Approved',
  ),
  Leave(
    requestID: 12353,
    empName: "Lee Sung-kyung",
    type: "Emergency Leave",
    startDate: DateTime(2024, 04, 13, 8, 30),
    endDate: DateTime(2024, 04, 13, 18, 30),
    status: 'Approved',
  ),
  Leave(
    requestID: 12354,
    empName: "Lee Ji-eun",
    type: "Vacation Leave",
    startDate: DateTime(2024, 04, 21, 8, 30),
    endDate: DateTime(2024, 04, 28, 18, 30),
    status: 'Decline',
  ),
  Leave(
    requestID: 12351,
    empName: "Kim Chae-won",
    type: "Vacation Leave",
    startDate: DateTime(2024, 01, 12, 8, 30),
    endDate: DateTime(2024, 01, 19, 18, 30),
    status: 'Approved',
  ),
  Leave(
    requestID: 12346,
    empName: "Kim Dahyun",
    type: "Maternity Leave",
    startDate: DateTime(2022, 04, 03, 8, 30),
    endDate: DateTime(2023, 02, 03, 18, 30),
    status: 'Approved',
  ),
];
