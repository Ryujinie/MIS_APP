import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/modals/hr_view_otrequest_modal.dart';
import 'package:ssi_mis_flutter/global/printing/hr/print_overtime_hr.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

// =============== OVERTIME TAB - ADMIN EMP MNGMT =============== //
class HREmpOvertime extends StatefulWidget {
  const HREmpOvertime({super.key});

  @override
  State<HREmpOvertime> createState() => _HREmpOvertimeState();
}

class _HREmpOvertimeState extends State<HREmpOvertime> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? bodyText = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: constants.mainTextBlack);

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
                  const CustomSearchBar2(hintText: 'Search'),

                  // ====================== Print Button ========================
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintHrOvertime();
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
                // ================= Column Data =================
                columns: [
                  //Date
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Date',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Start Time
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Start Time',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //End Time
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'End Time',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Total Hours
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Total Hours',
                          style: heading,
                        ),
                      ),
                    ),
                  ),

                  //Reason
                  DataColumn(
                    label: Flexible(
                      child: Center(
                        child: Text(
                          'Reason',
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

                // ===================== Row Data =====================
                // ignore: non_constant_identifier_names
                rows: overtimeRequest.map((OT) {
                  return DataRow(cells: [
                    //Date
                    DataCell(
                      Center(
                        child: Text(
                          DateFormat('MM/dd/yyyy').format(OT.date).toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //Start time
                    DataCell(
                      Center(
                        child: Text(
                          DateFormat.jm().format(OT.starttime).toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //End time
                    DataCell(
                      Center(
                        child: Text(
                          DateFormat.jm().format(OT.endtime).toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //Total Hours
                    DataCell(
                      Center(
                        child: Text(
                          OT.hours.toString(),
                          style: bodyText,
                        ),
                      ),
                    ),

                    //Reason
                    DataCell(
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            OT.reason.toString(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: bodyText,
                          ),
                        ),
                      ),
                    ),

                    //Status
                    DataCell(
                      Center(
                        child: OT.status == "Approved"
                            ? const PillContainer(
                                color: constants.hrstatusGreen,
                                label: "Approved",
                                labelColor: constants.mainTextWhite,
                                width: 130,
                              )
                            : OT.status == "For Approval"
                                ? const PillContainer(
                                    color: constants.hrstatusBlue,
                                    label: "For Approval",
                                    labelColor: constants.mainTextWhite,
                                    width: 130,
                                  )
                                : OT.status == "For Final Approval"
                                    ? const PillContainer(
                                        color: constants.hrstatusOrange,
                                        label: "For Final Approval",
                                        labelColor: constants.mainTextWhite,
                                        width: 130,
                                      )
                                    : OT.status == "Decline"
                                        ? const PillContainer(
                                            color: constants.hrstatusRed,
                                            label: "Decline",
                                            labelColor: constants.mainTextWhite,
                                            width: 130,
                                          )
                                        : Container(),
                      ),
                    ),

                    //Action
                    const DataCell(
                      Center(
                        child: HRViewOTRequest(),
                      ),
                    ),
                  ]);
                }).toList(),
                headingTextStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ========================== Sample Table Data ==========================

class OTRequest {
  final DateTime date;
  final DateTime starttime;
  final DateTime endtime;
  final String hours;
  final String reason;
  final String status;

  const OTRequest({
    required this.date,
    required this.starttime,
    required this.endtime,
    required this.hours,
    required this.reason,
    required this.status,
  });
}

final List<OTRequest> overtimeRequest = [
  OTRequest(
    date: DateTime(2024, 06, 04),
    starttime: DateTime(2024, 04, 08, 18, 00),
    endtime: DateTime(2024, 04, 08, 20, 30),
    hours: '2.5',
    status: 'For Approval',
    reason: 'Work Backlogs',
  ),
  OTRequest(
    date: DateTime(2024, 06, 02),
    starttime: DateTime(2024, 04, 08, 18, 00),
    endtime: DateTime(2024, 04, 08, 20, 30),
    hours: '2.5',
    status: 'For Final Approval',
    reason: 'Product Launch Preparation',
  ),
  OTRequest(
    date: DateTime(2024, 05, 04),
    starttime: DateTime(2024, 05, 08, 17, 00),
    endtime: DateTime(2024, 04, 08, 20, 00),
    hours: '3',
    status: 'Decline',
    reason: 'Quarterly report preparation',
  ),
  OTRequest(
    date: DateTime(2024, 05, 23),
    starttime: DateTime(2024, 05, 08, 19, 00),
    endtime: DateTime(2024, 04, 08, 23, 00),
    hours: '4',
    status: 'Approved',
    reason: 'Project deadline',
  ),
  OTRequest(
    date: DateTime(2024, 06, 01),
    starttime: DateTime(2024, 04, 08, 19, 00),
    endtime: DateTime(2024, 04, 08, 21, 30),
    hours: '2.5',
    status: 'Decline',
    reason: 'Backlogs',
  ),
  OTRequest(
    date: DateTime(2024, 05, 12),
    starttime: DateTime(2024, 04, 08, 18, 00),
    endtime: DateTime(2024, 04, 08, 19, 30),
    hours: '1.5',
    status: 'Approved',
    reason: 'Extra workload',
  ),
  OTRequest(
    date: DateTime(2024, 03, 15),
    starttime: DateTime(2024, 04, 08, 18, 00),
    endtime: DateTime(2024, 04, 08, 19, 00),
    hours: '1',
    status: 'Approved',
    reason: 'System upgrade',
  ),
  OTRequest(
    date: DateTime(2024, 02, 17),
    starttime: DateTime(2024, 04, 08, 19, 00),
    endtime: DateTime(2024, 04, 08, 22, 00),
    hours: '3',
    status: 'Approved',
    reason: 'Maintenance',
  ),
];
