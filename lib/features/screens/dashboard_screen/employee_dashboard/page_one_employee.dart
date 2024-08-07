import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_present_button.dart';
import 'package:ssi_mis_flutter/global/painter/emp_dash_piechart.dart';

bool isTimeOff = false;
final now = DateTime.now();
final formattedDateTime = DateFormat('d MMMM, yyyy hh:mm a').format(now);

// =============== Employee Dashboard Top Cards =============== //
class EmployeeDashPage1 extends StatefulWidget {
  const EmployeeDashPage1({super.key});

  @override
  State<EmployeeDashPage1> createState() => _EmployeeDashPage1State();
}

class _EmployeeDashPage1State extends State<EmployeeDashPage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(220, 30, 200, 0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 1470,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good day, Employee!',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.empBtn,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          'You have 2 pending tickets.',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 90,
                      width: 325,
                      decoration: BoxDecoration(
                        color: constants.mainTextWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                'Current time',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                formattedDateTime,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.access_time_filled_sharp,
                            size: 55,
                            color: constants.lightGray,
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 200),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 350,
                    width: 440,
                    decoration: BoxDecoration(
                      color: constants.mainTextWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              '   Today',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Spacer(),
                            const SmallDashStatusPresent(
                              color: constants.adminBtnGreen,
                              width: 100,
                              height: 30,
                              label: 'Present',
                              labelColor: constants.mainTextWhite,
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          thickness: 0.5,
                          color: constants.mainTextGrey,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 20),
                                            Text(
                                              'You have marked yourself',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 20),
                                            Text(
                                              'present today!',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 17),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 20),
                                            Text(
                                              '|',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.adminPrimary,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              '  Time left:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            Text(
                                              ' 8hrs 2m',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color:
                                                        constants.adminPrimary,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Positioned(
                              top: 30,
                              left: 250,
                              right: 10,
                              bottom: 0,
                              child: SizedBox(
                                height: 60,
                                width: 80,
                                child: TodayPieChart(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 72),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 400,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isTimeOff = !isTimeOff;
                                  });
                                },
                                color: isTimeOff
                                    ? constants.adminPrimary
                                    : constants.empBtn,
                                borderRadius: 20,
                                label: Text(
                                  isTimeOff ? "Mark Time Off" : "Mark Time In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: constants.mainTextWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 0),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 160,
                        width: 250,
                        decoration: BoxDecoration(
                          color: constants.mainTextWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                const Icon(
                                  Icons.access_time_filled_sharp,
                                  size: 55,
                                  color: constants.empBtn,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Average hours',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  '8h 36mins',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        height: 160,
                        width: 250,
                        decoration: BoxDecoration(
                          color: constants.mainTextWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 23),
                                Container(
                                  decoration: BoxDecoration(
                                    color: constants.empBtn,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.login_rounded,
                                    size: 45,
                                    color: constants.mainTextWhite,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Average Time in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  '9:26 AM',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        height: 160,
                        width: 250,
                        decoration: BoxDecoration(
                          color: constants.mainTextWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15),
                                const Icon(
                                  Icons.access_time_filled_sharp,
                                  size: 55,
                                  color: constants.adminBtnGreen,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'On-time Arrival',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  '86.53 %',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.adminBtnGreen,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        height: 160,
                        width: 250,
                        decoration: BoxDecoration(
                          color: constants.mainTextWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 23),
                                Container(
                                  decoration: BoxDecoration(
                                    color: constants.adminBtn,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.logout_rounded,
                                    size: 45,
                                    color: constants.mainTextWhite,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Average Time off',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  '8:02 PM',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 0),
                ],
              ),
              const SizedBox(width: 30),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: 440,
                      decoration: BoxDecoration(
                        color: constants.mainTextWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  '   My Attendance',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: constants.mainTextGrey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View Stats',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: constants.empBtn,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              thickness: 0.5,
                              color: constants.mainTextGrey,
                              indent: 20,
                              endIndent: 20,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.circle,
                                          color: constants.adminBtnGreen,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '117',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'on time',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.circle,
                                          color: constants.lightGray,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '16',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'late time in',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.circle,
                                          color: constants.adminPrimary,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '6',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'absent',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        const Icon(
                                          Icons.circle,
                                          color: constants.mngrPrimary,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '8',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'approved leaves',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: constants.mainTextGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 80,
                                      child: MyAttendancePieChart(),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 110),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
