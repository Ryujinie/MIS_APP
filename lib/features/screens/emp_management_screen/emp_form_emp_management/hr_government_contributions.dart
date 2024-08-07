// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/global/widgets/textformfield.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_emergency_contact.dart';

// =============== CONTINUE BUTTON PRESSED -> GOVERNMENT CONTRIBUTIONS =============== //
class GovContributionsPressed extends StatelessWidget {
  const GovContributionsPressed({
    super.key,
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
          indexProvider.setNewEmpAdminIndex(2);
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
      child: Row(
        children: [
          Text(
            'Continue',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: constants.mainTextWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(width: 5.0),
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
class BackToJobPressed extends StatefulWidget {
  const BackToJobPressed({
    super.key,
    required this.color,
    this.icon,
    this.label,
    required this.borderRadius,
  });

  final Color color;
  final Icon? icon;
  final Widget? label;
  final double borderRadius;

  @override
  State<BackToJobPressed> createState() => _BackToJobPressedState();
}

class _BackToJobPressedState extends State<BackToJobPressed> {
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

// =============== GOVERNMENT CONTRIBUTIONS - ADMIN EMPLOYEE FORM =============== //
class GovContributionsAddNewEmp extends StatefulWidget {
  const GovContributionsAddNewEmp({super.key});

  @override
  State<GovContributionsAddNewEmp> createState() =>
      _GovContributionsAddNewEmpState();
}

class _GovContributionsAddNewEmpState extends State<GovContributionsAddNewEmp> {
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
                        ' >  Government Contributions',
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
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // =============== BACK BUTTON =============== //
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon
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

                  // Back text
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

              // =============== STEP COUNTER TEXT =============== //
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
                            color: constants.lightGray,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Job Details',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '••••',
                            style: stepCounterGray,
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Symbols.counter_3_rounded,
                            color: constants.hrPrimary,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Government Contributions',
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

              // ========================= GOVERNMENT CONTRIBUTIONS CARD ========================= //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(280, 0, 280, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: constants.adminFilter,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // ================ TIN, SSS, PAGIBIG, PHILHEALTH Column ================
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 24, 50, 0),
                              child: Column(
                                children: [
                                  // Government Contributions
                                  Text(
                                    'Government Contributions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),

                                  const SizedBox(height: 30),

                                  // ========================= TIN Row ===========================
                                  Row(
                                    children: [
                                      Expanded(
                                        // ================= TIN Column ====================
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //TIN
                                            Text(
                                              'TIN',
                                              style: label,
                                            ),

                                            //Input Field
                                            const CustomTextFormField2(
                                              isViewed: false,
                                              width: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // ======================== SSS Row ==========================
                                  Row(
                                    children: [
                                      // ================= SSS Column ====================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //SSS
                                            Text(
                                              'SSS',
                                              style: label,
                                            ),

                                            //Input Field
                                            const CustomTextFormField2(
                                              isViewed: false,
                                              width: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // ======================== PAG-IBIG Row =========================
                                  Row(
                                    children: [
                                      // ================= PAG-IBIG Column ====================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //PAG-IBIG
                                            Text(
                                              'PAGIBIG',
                                              style: label,
                                            ),

                                            //Input Field
                                            const CustomTextFormField2(
                                              isViewed: false,
                                              width: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  // ======================= PHILHEALTH Row ===========================
                                  Row(
                                    children: [
                                      Expanded(
                                        // ================= PHILHEALTH Column ====================
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //PhilHealth
                                            Text(
                                              'Philhealth',
                                              style: label,
                                            ),

                                            //Input Field
                                            const CustomTextFormField2(
                                              isViewed: false,
                                              width: double.infinity,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ================ Back && Continue button ================ //
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 24, 50, 0),
                          child: Row(
                            children: [
                              Spacer(),
                              SizedBox(
                                child: BackToJobPressed(
                                  color: constants.lightGray,
                                  borderRadius: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              EmergencyContactPressed(
                                color: constants.hrPrimary,
                                borderRadius: 20,
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
