import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class MyAttendancePieChart extends StatelessWidget {
  const MyAttendancePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '132',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '/262',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: constants.adminPrimary,
                value: 6,
                title: '',
                radius: 30,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              PieChartSectionData(
                color: constants.adminBtnGreen,
                value: 60,
                title: '',
                radius: 30,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              PieChartSectionData(
                color: constants.lightGray,
                value: 15,
                title: '',
                radius: 30,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              PieChartSectionData(
                color: constants.mngrPrimary,
                value: 8,
                title: '',
                radius: 30,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 60,
          ),
        ),
      ],
    );
  }
}

class TodayPieChart extends StatelessWidget {
  const TodayPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 15,
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '63%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'in office',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: constants.mainTextGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: constants.mngrPrimary,
                value: 63,
                title: '',
                radius: 20,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              PieChartSectionData(
                color: constants.lightGray,
                value: 37,
                title: '',
                radius: 20,
                titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 60,
          ),
        ),
      ],
    );
  }
}
