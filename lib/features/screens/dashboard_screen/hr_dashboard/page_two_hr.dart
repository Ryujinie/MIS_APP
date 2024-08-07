import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/admin_dashboard/news_record.dart';
import 'package:ssi_mis_flutter/features/screens/dashboard_screen/admin_dashboard/task_record.dart';

// =============== HR Dashboard Bottom Cards =============== //
class HRDashPage2 extends StatelessWidget {
  const HRDashPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 0),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: constants.mainTextWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        '   In Progress',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: constants.mainTextGrey,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            '2',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            '  Tasks',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.rotate_left_rounded,
                            size: 70,
                            color: constants.lightGray,
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: constants.mainTextWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        '   Completed',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: constants.mainTextGrey,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            '4',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            '  Tasks',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            size: 65,
                            color: constants.lightGray,
                          ),
                          const SizedBox(width: 35),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 320,
                  width: 720,
                  decoration: BoxDecoration(
                    color: constants.mainTextWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          '   Tasks',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: constants.mainTextGrey,
                        ),
                        DataTable(
                          columnSpacing: 40,
                          columns: [
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Task ID',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Task Description',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Task Label',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Priority',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Flexible(
                                child: Center(
                                  child: Text(
                                    'Due Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: tasks.map(
                            (tasks) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        tasks.taskID,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        tasks.taskDescription,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        tasks.taskLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        tasks.taskPriority,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        tasks.taskDueDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: constants.mainTextGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const SizedBox(height: 15),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                color: constants.mainTextWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '   Overdue',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const Divider(
                    thickness: 1.0,
                    color: constants.mainTextGrey,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        '1',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        '  Task',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 35,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.warning,
                        size: 60,
                        color: constants.lightGray,
                      ),
                      const SizedBox(width: 35),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 320,
              width: 350,
              decoration: BoxDecoration(
                color: constants.mainTextWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    Text(
                      '   News and Events',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: constants.mainTextGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      color: constants.mainTextGrey,
                    ),
                    const SizedBox(height: 0),
                    DataTable(
                      columnSpacing: 10,
                      columns: [
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'No.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Flexible(
                            child: Center(
                              child: Text(
                                'Subject',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      rows: newsEvents.map(
                        (newsEvents) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Center(
                                  child: Text(
                                    newsEvents.newsID,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    newsEvents.newsDescription,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(
                                    newsEvents.newsSubject,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
