// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/dropdown_items.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/global/widgets/dropdown.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_government_contributions.dart';

// =============== INDEX VARIABLE - BODY NAVIGATION =============== //
String? selectedJob;
String? selectedEmpType;
String? selectedRole;
String? selectedDept;
String? selectedSched;

// =============== CONTINUE BUTTON PRESSED -> JOB DETAILS =============== //
class JobDetailsPressed extends StatelessWidget {
  const JobDetailsPressed({
    super.key,
    //required this.onPressed,
    required this.color,
    this.icon,
    this.label,
    required this.borderRadius,
  });

  //final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final Widget? label;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final indexProvider =
            Provider.of<EmpFormIndexProvider>(context, listen: false);
        if (indexProvider != null) {
          indexProvider.setNewEmpAdminIndex(1);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(22, 10, 18, 12),
        ),
      ),
      // child: widget.icon ?? widget.label!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Continue
          Text(
            'Continue',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: constants.mainTextWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(width: 5.0),

          //Icon
          const SizedBox(
            height: 18,
            width: 18,
            child: Icon(
              Icons.arrow_forward_rounded,
              color: constants.mainTextWhite,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// =============== BACK BUTTON PRESSED -> JOB DETAILS =============== //
class BackToPersonalPressed extends StatefulWidget {
  const BackToPersonalPressed({
    super.key,
    //required this.onPressed,
    required this.color,
    this.icon,
    this.label,
    required this.borderRadius,
  });

  //final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final Widget? label;
  final double borderRadius;

  @override
  State<BackToPersonalPressed> createState() => _BackToPersonalPressedState();
}

class _BackToPersonalPressedState extends State<BackToPersonalPressed> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final indexProvider =
            Provider.of<EmpFormIndexProvider>(context, listen: false);
        if (indexProvider != null) {
          indexProvider.setNewEmpAdminIndex(0);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
      child: Text(
        'Back',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: constants.mainTextWhite,
              fontSize: 16,
            ),
      ),
    );
  }
}

// =============== JOB DETAILS - HR EMPLOYEE FORM =============== //
class JobDetailsAddNewEmp extends StatefulWidget {
  const JobDetailsAddNewEmp({super.key});

  @override
  State<JobDetailsAddNewEmp> createState() => _JobDetailsAddNewEmpState();
}

class _JobDetailsAddNewEmpState extends State<JobDetailsAddNewEmp> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? stepCounterGray =
        Theme.of(context).textTheme.labelLarge?.copyWith(
              color: constants.lightGray,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
    final TextStyle? label = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: constants.mainTextGrey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    return Scaffold(
      // ======================== Breadcrumbs ========================
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                  child: Row(
                    children: [
                      Text(
                        'Human Resources',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        ' >  Employee Management',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        ' >  Job Details',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                            ),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: DateFormat('h').format(DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                            ),
                            TextSpan(
                              text: DateFormat(':mm ').format(DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                            ),
                            TextSpan(
                              text: DateFormat('a ').format(DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 20,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      //Divider
                      Container(
                        height: 25,
                        width: 1.5,
                        color: constants.mainTextGrey,
                      ),
                      Text(
                        ' PST',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: constants.mainTextGrey,
                              fontSize: 20,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //
      body: Container(
        color: constants.adminBG,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // ===================== BACK BUTTON =====================
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // icon
                  IconButton(
                    onPressed: () {
                      final indexProvider =
                          Provider.of<IndexProvider>(context, listen: false);
                      if (indexProvider != null) {
                        indexProvider.setProfileAdminEmpMngmtIndex(0);
                      }
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: constants.lightGray,
                  ),

                  // back
                  Text(
                    'Back',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: constants.lightGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),

              // ======================= STEP COUNTER TEXT ======================= //
              Row(
                children: [
                  Flexible(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Symbols.counter_1_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Personal Details',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '••••',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Symbols.counter_2_rounded,
                            color: constants.hrPrimary,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Job Details',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: constants.hrPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '••••',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: constants.hrPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Symbols.counter_3_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Government Contributions',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '••••',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Symbols.counter_4_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Emergency Contact',
                            style: stepCounterGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ====================== JOB DETAILS CARD ====================== //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(250, 0, 250, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: constants.adminFilter,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ==================== Form Column ====================
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 24, 50, 0),
                              child: Column(
                                children: [
                                  // Job Details
                                  Text(
                                    'Job Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),

                                  const SizedBox(height: 24),

                                  // ================== Job Position, Employment Type Row =================
                                  Row(
                                    children: [
                                      // ================== Job Position Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Job Position
                                            Text(
                                              'Job Position',
                                              style: label,
                                            ),

                                            //Job Dropdown

                                            CustomDropdown(
                                              items: jobPositions,
                                              hintText: 'Select Job Position',
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      // ================== Employment Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Employment Type
                                            Text(
                                              'Employment Type',
                                              style: label,
                                            ),

                                            //Employment Type dropdown
                                            CustomDropdown(
                                              items: employmentTypes,
                                              hintText:
                                                  'Select Employment Type',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // ================== Role, Department Row =================
                                  Row(
                                    children: [
                                      // ================== Role Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Role
                                            Text(
                                              'Role',
                                              style: label,
                                            ),

                                            //Role Dropdown

                                            CustomDropdown(
                                              items: roles,
                                              hintText: 'Select Role',
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      // ================== Department Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Department
                                            Text(
                                              'Department',
                                              style: label,
                                            ),

                                            // Department Dropdown

                                            CustomDropdown(
                                              items: departments,
                                              hintText: 'Select Department',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // ========================== Schedule Row =======================
                                  Row(
                                    children: [
                                      // ================== Schedule Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Schedule
                                            Text(
                                              'Schedule',
                                              style: label,
                                            ),

                                            // Schedule Dropdown

                                            CustomDropdown(
                                              items: schedules,
                                              hintText: 'Select Schedule',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ================ Back && Continue button ================
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 24, 50, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Spacer(),

                                  // Back Button
                                  SizedBox(
                                    child: BackToPersonalPressed(
                                      color: constants.lightGray,
                                      borderRadius: 20,
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  // Continue Button
                                  GovContributionsPressed(
                                    color: constants.hrPrimary,
                                    borderRadius: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _DropDownFieldState extends State<DropDownField> {
//   late String selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 35,
//       width: double.infinity,
//       child: Container(
//         decoration: const BoxDecoration(
//           color: constants.adminBG,
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           ),
//         ),
        // child: DropdownButtonFormField<String>(
//           borderRadius: BorderRadius.circular(20),
//           isDense: true,
//           focusColor: Colors.transparent,
//           autofocus: false,
//           style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                 color: constants.mainTextGrey,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//           hint: Text(
//             widget.hintText ?? " ",
//             style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                   color: constants.lightGray,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//           ),
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             isDense: true,
//             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           ),
//           value: widget.value,
//           items: widget.dropdownItems,
//           onChanged: (newValue) {
//             setState(() {
//               selectedValue = newValue!;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
