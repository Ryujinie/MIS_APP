import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/supervisor_viewsched_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/schedule_data/schedule_list.dart';

class SupervisorScheduleScreen extends StatefulWidget {
  const SupervisorScheduleScreen({super.key});

  @override
  State<SupervisorScheduleScreen> createState() =>
      _SupervisorScheduleScreenState();
}

class _SupervisorScheduleScreenState extends State<SupervisorScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? heading =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              color: constants.mainTextBlack,
            );
    final TextStyle? body = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: constants.mainTextBlack,
        );

    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          //======================= Search Bar, Date Filter, Create Sched =====================
          const Row(
            children: [
              // Search Bar
              CustomSearchBar(hintText: 'Search Schedule...'),

              SizedBox(width: 4),

              // Date Filter
              DateFilter(),
            ],
          ),

          const SizedBox(height: 12),

          // ============================ TABLE ============================
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: constants.adminTable,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ========================= Data table =========================
                      DataTable(
                        columnSpacing: 60,
                        // ================= Column Data =================
                        columns: [
                          //Shift ID
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'ID',
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

                          //Rest Day
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Rest Day',
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

                        // ==================== Row Data ====================
                        rows: scheduleList.map(
                          (schedule) {
                            return DataRow(
                              cells: [
                                //Emp ID
                                DataCell(
                                  Center(
                                    child: Text(
                                      schedule.shiftID.toString(),
                                      style: body,
                                    ),
                                  ),
                                ),

                                //Start Date
                                DataCell(
                                  Center(
                                    child: Text(
                                      DateFormat('MM/dd/yyyy')
                                          .format(schedule.startDate)
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
                                          .format(schedule.endDate)
                                          .toString(),
                                      style: body,
                                    ),
                                  ),
                                ),

                                //Start Time
                                DataCell(
                                  Center(
                                    child: Text(
                                      DateFormat.jm()
                                          .format(schedule.startTime)
                                          .toString(),
                                      style: body,
                                    ),
                                  ),
                                ),

                                //End Time
                                DataCell(
                                  Center(
                                    child: Text(
                                      DateFormat.jm()
                                          .format(schedule.endTime)
                                          .toString(),
                                      style: body,
                                    ),
                                  ),
                                ),

                                //Rest Day
                                DataCell(
                                  Padding(
                                    padding: const EdgeInsets.only(left: 48),
                                    child: Text(
                                      schedule.restDay.join(", "),
                                    ),
                                  ),
                                ),

                                //Actions
                                DataCell(
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ViewButton(
                                          onPressed: () => showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const SupervisorViewSchedule();
                                            },
                                          ),
                                        ),
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
