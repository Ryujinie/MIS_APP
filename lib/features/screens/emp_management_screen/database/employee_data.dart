// sample employee_data.dart

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_absent_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_late_button.dart';
import 'package:ssi_mis_flutter/global/buttons/status_present_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class DataEmployee {
  final String id;
  final String name;
  final String position;
  final String department;
  final Widget status;
  final Widget action;

  const DataEmployee({
    required this.id,
    required this.name,
    required this.position,
    required this.department,
    required this.status,
    required this.action,
  });
}

List<DataEmployee> employeeData = [
  DataEmployee(
    id: 'EMP001',
    name: 'Gracie Gates',
    position: 'Quality Assurance',
    department: 'Information Techonology',
    status: const StatusPresent(),
    action: Row(
      children: [
        // AdminEmpMngmtProfileButton(
        //   onPressed: () {},
        //   //color: Colors.white,
        //   //borderRadius: 0.0,
        //   //icon: const Icon(Icons.visibility)
        //   color: constants.lightGray,
        // ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP002',
    name: 'Jane Smith',
    position: 'Product Manager',
    department: 'Product',
    status: const StatusPresent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {},
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {},
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP003',
    name: 'Michael Lee',
    position: 'UI/UX Designer',
    department: 'Design',
    status: const StatusLate(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP004',
    name: 'Olivia Jones',
    position: 'Marketing Specialist',
    department: 'Marketing',
    status: const StatusAbsent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP005',
    name: 'David Garcia',
    position: 'Sales Manager',
    department: 'Sales',
    status: const StatusPresent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP006',
    name: 'Emily Williams',
    position: 'Data Analyst',
    department: 'Data Science',
    status: const StatusLate(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP007',
    name: 'Charles Brown',
    position: 'DevOps Engineer',
    department: 'IT Operations',
    status: const StatusLate(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP008',
    name: 'Amanda Miller',
    position: 'Content Writer',
    department: 'Marketing',
    status: const StatusPresent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP009',
    name: 'Robert Davis',
    position: 'Quality Assurance Engineer',
    department: 'QA',
    status: const StatusAbsent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          //color: Colors.white, // Adjust color as desired
          //borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
  DataEmployee(
    id: 'EMP010',
    name: 'Catherine Wilson',
    position: 'Business Analyst',
    department: 'Business Development',
    status: const StatusPresent(),
    action: Row(
      children: [
        CustomElevatedButton(
          onPressed: () {
            // Handle button press action (specific to each employee if needed)
          },
          color: Colors.white, // Adjust color as desired
          borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.visibility),
        ),
        CustomAlertDialogButton(
          onPressed: () {
            // Handle confirmation result here
          },
          // color: Colors.white, // Adjust color as desired
          // borderRadius: 0.0, // Adjust corner radius as desired
          icon: const Icon(Icons.archive),
          color: constants.lightGray,
        ),
      ],
    ),
  ),
];
