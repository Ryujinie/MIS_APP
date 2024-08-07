import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/schedule_screen/schedule_data/schedule_archived.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/schedule_data/schedule_list.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/admin_confirm_archive_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_createsched_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_unarchive_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_viewsched_modal.dart';
import 'package:ssi_mis_flutter/global/tabviews/admin_tabview.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class AdminScheduleScreen extends StatefulWidget {
  const AdminScheduleScreen({super.key});

  @override
  State<AdminScheduleScreen> createState() => _AdminScheduleScreenState();
}

class _AdminScheduleScreenState extends State<AdminScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          //======================= Search Bar, Date Filter, Create Sched =====================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  //=============== Search Employee ================
                  CustomSearchBar(hintText: 'Search employee'),

                  SizedBox(width: 4),

                  // =============== Date Filter ================
                  DateFilter(),
                ],
              ),

              // =============== Create Schedule ================
              CustomElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AdminCreateSchedule();
                  },
                ),
                color: constants.adminBtn,
                borderRadius: 8,
                label: Text(
                  "Create Schedule",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: constants.mainTextWhite,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ====================== TabBar =======================
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: constants.adminTable,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: DefaultTabController(
                length: _tabViews.length,
                child: Column(
                  children: [
                    // ================== Tabs ===================
                    const AdminTab(
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Archived'),
                      ],
                    ),

                    // =============== TabBar View ================
                    Expanded(
                      child: TabBarView(children: _tabViews),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Widget> _tabViews = [
  const AdminSchedRecords(),
  const AdminSchedArchived(),
];

class AdminSchedRecords extends StatelessWidget {
  const AdminSchedRecords({super.key});

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
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: constants.adminTable,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // =================== Data table ====================
              DataTable(
                columnSpacing: 60,
                // ============== Column Data ===============
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

                // ============== Row Data ===============
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ViewButton(
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AdminViewSchedule();
                                      }),
                                ),
                                // ArchiveButton(
                                //   onPressed: () => showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return const ConfirmArchive();
                                //     },
                                //   ),
                                // ),
                                const ConfirmArchive(
                                  user: 'admin',
                                ),
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
      ),
    );
  }
}

class AdminSchedArchived extends StatelessWidget {
  const AdminSchedArchived({super.key});

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
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: constants.adminTable,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // =================== Data table ====================
              DataTable(
                columnSpacing: 60,
                // ============== Column Data ===============
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

                // ==================== Row Data =====================
                rows: scheduleArchived.map(
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ViewButton(
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AdminViewSchedule();
                                    },
                                  ),
                                ),
                                // UnarchiveButton(
                                //   onPressed: () => showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return const Unarchive();
                                //     },
                                //   ),
                                // ),
                                const Unarchive(
                                  user: 'admin',
                                ),
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
      ),
    );
  }
}
