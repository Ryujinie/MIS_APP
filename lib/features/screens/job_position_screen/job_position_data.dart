import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/modals/admin_job_position_update_modal.dart';

class JobPositionRecord extends StatelessWidget {
  const JobPositionRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: constants.adminTable,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =================== Data table ====================
            DataTable(
              // ============== Column Data ===============
              columns: [
                //Job Position ID
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Job Position ID',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Job Position
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Job Position',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Date Created
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Date Created',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),
              ],

              // ============== Row Data ===============
              rows: jobPositionData.map(
                (jobPositionData) {
                  return DataRow(
                    cells: [
                      //ID
                      DataCell(
                        Center(
                          child: Text(
                            jobPositionData.jobPositionID.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Job Position Name
                      DataCell(
                        Center(
                          child: SizedBox(
                            width: 150,
                            child: Text(
                              jobPositionData.jobPosition,
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

                      //Date Created
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy')
                                .format(jobPositionData.dateCreated)
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

                      //Actions
                      const DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              JobPositionUpdate(),
                              //ConfirmArchive(),
                            ],
                          ),
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
    );
  }
}

class JobPositionData {
  final int jobPositionID;
  final String jobPosition;
  final DateTime dateCreated;

  JobPositionData({
    required this.jobPositionID,
    required this.jobPosition,
    required this.dateCreated,
  });
}

// ========================== Sample Table Data ==========================

final List<JobPositionData> jobPositionData = [
  JobPositionData(
    jobPositionID: 0001,
    jobPosition: "IT",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0002,
    jobPosition: "Engineering",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0003,
    jobPosition: "Human Resources",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0004,
    jobPosition: "Admin",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0005,
    jobPosition: "Accounting",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0006,
    jobPosition: "Marketing",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0007,
    jobPosition: "Design",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0008,
    jobPosition: "QA",
    dateCreated: DateTime(2024, 04, 08),
  ),
  JobPositionData(
    jobPositionID: 0009,
    jobPosition: "Business Development",
    dateCreated: DateTime(2024, 04, 08),
  ),
];
