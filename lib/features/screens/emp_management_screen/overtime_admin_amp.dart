import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_In_Review.dart';
import 'package:ssi_mis_flutter/global/buttons/status_on_progress_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_rejected.dart';
import 'package:ssi_mis_flutter/global/buttons/status_approved.dart';
import 'package:ssi_mis_flutter/global/buttons/status_pending_button.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/modals/admin_view_otrequest_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_createotrequest_modal.dart';

class OvertimeAdminEmp extends StatelessWidget {
  const OvertimeAdminEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      child: Column(
        children: [
          //
          const SizedBox(
            height: 24,
          ),

          //============================ Action Buttons ============================
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //================ Search Employee ================
                Container(
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(
                      color: constants.adminFilter,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search Employee',
                          hintStyle: TextStyle(
                            color: constants.lightGray,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.search,
                              color: constants.lightGray,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )),
                //=============== Create Schedule ================
                CustomElevatedButton(
                  onPressed: () {
                    AdminCreateOT;
                  },
                  color: constants.adminBtnGreen,
                  borderRadius: 8,
                  label: const Text(
                    "Create Overtime Request",
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

          //
          const SizedBox(
            width: double.infinity,
            height: 12,
          ),

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
                  children: [
                    // =================== Data table ====================
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 12, 48, 24),
                      child: DataTable(
                        columns: const [
                          DataColumn(
                              label: Flexible(
                                  child: Center(child: Text('Employee ID')))),
                          DataColumn(
                              label: Flexible(
                                  child:
                                      Center(child: Text('Requester Name')))),
                          DataColumn(
                              label:
                                  Flexible(child: Center(child: Text('Date')))),
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
                                Center(child: Text(oTRequests.requesterID))),
                            DataCell(Center(
                              child: Text(DateFormat('MM/dd/yyyy')
                                  .format(oTRequests.date)
                                  .toString()),
                            )),
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
                                // ConfirmArchive(),
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
          ),
        ],
      ),
    );
  }
}

class OTRequest {
  final String employeeID;
  final String requesterID;
  final DateTime date;
  final DateTime starttime;
  final DateTime endtime;
  final String hours;
  final Widget remarks;

  const OTRequest({
    required this.employeeID,
    required this.requesterID,
    required this.date,
    required this.starttime,
    required this.endtime,
    required this.hours,
    required this.remarks,
  });
}

final List<OTRequest> overtimeRequest = [
  OTRequest(
    employeeID: 'EMP001',
    requesterID: 'John Doe',
    date: DateTime.now(),
    starttime: DateTime.now(),
    endtime: DateTime.now(),
    hours: '1.5',
    remarks: const StatusInReview(),
  ),
  OTRequest(
    employeeID: 'EMP002',
    requesterID: 'Jane Smith',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3',
    remarks: const StatusPending(),
  ),
  OTRequest(
    employeeID: 'EMP003',
    requesterID: 'Michael Lee',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusInReview(),
  ),
  OTRequest(
    employeeID: 'EMP004',
    requesterID: 'Olivia Jones',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusOnProgress(),
  ),
  OTRequest(
    employeeID: 'EMP005',
    requesterID: 'David Garcia',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '7',
    remarks: const StatusApproved(),
  ),
  OTRequest(
    employeeID: 'EMP006',
    requesterID: 'Emily Williams',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '13',
    remarks: const StatusRejected(),
  ),
  OTRequest(
    employeeID: 'EMP007',
    requesterID: 'Charles Brown',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '5',
    remarks: const StatusInReview(),
  ),
  OTRequest(
    employeeID: 'EMP008',
    requesterID: 'Amanda Miller',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '3.5',
    remarks: const StatusRejected(),
  ),
  OTRequest(
    employeeID: 'EMP009',
    requesterID: 'Robert Davis',
    date: DateTime.now(),
    starttime: DateTime(2024, 4, 8),
    endtime: DateTime(2024, 04, 08),
    hours: '24',
    remarks: const StatusRejected(),
  ),
  OTRequest(
    employeeID: 'EMP010',
    requesterID: 'Catherine Wilson',
    date: DateTime.now(),
    starttime: DateTime(2024, 04, 08),
    endtime: DateTime(2024, 04, 08),
    hours: '4',
    remarks: const StatusOnProgress(),
  ),
];
