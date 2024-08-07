import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_present_button.dart';
import 'package:ssi_mis_flutter/global/painter/admin_dash_barchart.dart';

// =============== Admin Dashboard Top Cards =============== //
class AdminDashPage1 extends StatelessWidget {
  const AdminDashPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 30),
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
                        '   Total Attendance',
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
                            '142',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            '  Days',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.back_hand_rounded,
                            size: 60,
                            color: constants.lightGray,
                          ),
                          const SizedBox(width: 40),
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
                        '   Available Leaves',
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
                            '3',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            '  Days',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.check_circle,
                            size: 65,
                            color: constants.lightGray,
                          ),
                          const SizedBox(width: 40),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'Remaining',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            ' leaves:',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Text(
                            ' 4',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.adminPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            ' days',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.adminPrimary,
                                      fontSize: 16,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        '   Performance Metric',
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 180,
                            child: CustomPaint(
                              painter: AdminBarChartPainter(
                                data: [
                                  BarChartItem(value: 45, color: Colors.blue),
                                  BarChartItem(value: 90, color: Colors.green),
                                  BarChartItem(value: 60, color: Colors.orange),
                                ],
                                data2: [
                                  BarChartItem(
                                      value: 90, color: Colors.lightBlue),
                                  BarChartItem(
                                      value: 55, color: Colors.lightGreen),
                                  BarChartItem(
                                      value: 30, color: Colors.amber.shade300),
                                ],
                                month1Label: "",
                                month2Label: "",
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          SizedBox(
                            width: 300,
                            height: 180,
                            child: CustomPaint(
                              painter: AdminBarChartPainter(
                                data: [
                                  BarChartItem(value: 95, color: Colors.blue),
                                  BarChartItem(value: 60, color: Colors.green),
                                  BarChartItem(value: 85, color: Colors.orange),
                                ],
                                data2: [
                                  BarChartItem(
                                      value: 80, color: Colors.lightBlue),
                                  BarChartItem(
                                      value: 55, color: Colors.lightGreen),
                                  BarChartItem(
                                      value: 90, color: Colors.amber.shade300),
                                ],
                                month1Label: "",
                                month2Label: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 140),
                          Text(
                            'May',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const Spacer(),
                          Text(
                            'June',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(width: 140),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 320,
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
                    '   Active Attendance',
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Center(
                          child: Text(
                            '00:00:00',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: Center(
                          child: Container(
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(92, 0, 71, 171),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'May 16,',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      ' 2024',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1.0,
                                  color: constants.mainTextGrey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Fixed hours:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: constants.mainTextGrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      ' 10 hours',
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          color: constants.adminPrimary,
                          borderRadius: 20,
                          label: Text(
                            "Time In",
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    '   Attendance Tracker',
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
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        'May 16,',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        ' Thursday',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 28,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          color: const Color.fromARGB(92, 0, 71, 171),
                          borderRadius: 20,
                          label: Text(
                            "See all",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: constants.mainTextWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        'Time In:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        ' 8:50 AM',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        'Time Out:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        ' 6:00 PM',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Spacer(),
                      DashStatusPresent(
                        color: constants.adminBtnGreen,
                        width: 90,
                        height: 28,
                        label: "Present",
                        labelColor: constants.mainTextWhite,
                        fontSize: 16,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
