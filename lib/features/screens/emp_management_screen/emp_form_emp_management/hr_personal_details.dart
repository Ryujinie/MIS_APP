import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/dropdown_items.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_job_details.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/screens_emp_management/hr_emp_management_screen.dart';
import 'package:provider/provider.dart';
import 'package:ssi_mis_flutter/global/widgets/birthdate_picker.dart';
import 'package:ssi_mis_flutter/global/widgets/dropdown.dart';
import 'package:ssi_mis_flutter/global/widgets/textformfield.dart';
import 'package:ssi_mis_flutter/provider/index.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_emergency_contact.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/emp_form_emp_management/hr_government_contributions.dart';

// =============== INDEX VARIABLE - BODY NAVIGATION =============== //
String? selectedGender;

// =============== ADD NEW EMPLOYEE - HR EMP MNGMT =============== //
class HRNewEmp extends StatefulWidget {
  const HRNewEmp({super.key});

  @override
  State<HRNewEmp> createState() => _IndexAddNewEmpHREmpMngmt();
}

// =============== INDEX MANAGEMENT - BODY NAVIGATION CLASS =============== //
class _IndexAddNewEmpHREmpMngmt extends State<HRNewEmp> {
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  final _NewEmpHRState _personalDetailsState = _NewEmpHRState();

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<EmpFormIndexProvider>(context);
    final currentIndex = indexProvider.currentIndex;

    return IndexedStack(
      index: currentIndex,
      children: [
        _personalDetailsState.build(context), //provider index 0
        const JobDetailsAddNewEmp(), //provider index 1
        const GovContributionsAddNewEmp(), //provider index 2
        const EmergencyContactAddNewEmp(), //provider index 3
      ],
    );
  }
}

// ========================== PERSONAL DETAILS - HR EMPLOYEE FORM ========================== //
class _NewEmpHRState extends State<HRNewEmp> {
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
                        ' >  Personal Details',
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // ===================== Back Button =====================
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // iconbutton
                  IconButton(
                    onPressed: () {
                      final indexProvider =
                          Provider.of<IndexProvider>(context, listen: false);
                      indexProvider.setProfileAdminEmpMngmtIndex(0);
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

              // ===================== STEP COUNTER TEXT =====================
              Row(
                children: [
                  Flexible(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 1
                          const Icon(
                            Symbols.counter_1_rounded,
                            color: constants.hrPrimary,
                            size: 30,
                          ),

                          const SizedBox(width: 5),

                          // Personal Details
                          Text(
                            'Personal Details',
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

                          // 2
                          const Icon(
                            Symbols.counter_2_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),

                          const SizedBox(width: 5),

                          //Job Details
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

                          // 3
                          const Icon(
                            Symbols.counter_3_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),

                          const SizedBox(width: 5),

                          // Government
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

                          // 4
                          const Icon(
                            Symbols.counter_4_rounded,
                            color: constants.lightGray,
                            size: 30,
                          ),

                          const SizedBox(width: 5),

                          // Emergency
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

              // ====================== PERSONAL DETAILS CARD ====================== //
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(250, 0, 250, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: constants.hrTable,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // ==================== Form Column ====================
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 24, 50, 0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 0),

                                  //Personal Details
                                  Text(
                                    'Personal Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: constants.mainTextGrey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),

                                  const SizedBox(height: 20),

                                  // ================= First Name, Middle Name Row =================
                                  Row(
                                    children: [
                                      // ================= First Name Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //First Name
                                            Text(
                                              'First Name',
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

                                      const SizedBox(width: 20),

                                      // ================= Middle Name Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Middle Name
                                            Text(
                                              'Middle Name',
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

                                  // =================== Last Name, Suffix Row ===================
                                  Row(
                                    children: [
                                      // =========== Last Name Column =============
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Last Name
                                            Text(
                                              'Last Name',
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

                                      const SizedBox(width: 20),

                                      // ================ Suffix Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Suffix
                                            Text(
                                              'Suffix',
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

                                  // ================ Gender, Date of Birth, Phone Number Row =================
                                  Row(
                                    children: [
                                      // ================ Gender Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Gender
                                            Text(
                                              'Gender',
                                              style: label,
                                            ),

                                            CustomDropdown(
                                              items: genders,
                                              hintText: 'select gender',
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      // ================ Birthdate Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Birthdate label
                                            Text(
                                              'Date of Birth',
                                              style: label,
                                            ),

                                            // BirthDate
                                            const BirthDatePicker(),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      // ================ Phone/Telephone Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Landline/Telephone
                                            Text(
                                              'Landline/Telephone',
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

                                  // ==================== Email Address Row =====================
                                  Row(
                                    children: [
                                      // ================ Email Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Email
                                            Text(
                                              'Email Address',
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

                                  // ========================= Home Address Row =======================
                                  Row(
                                    children: [
                                      // ================ Home Address Column =================
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //Home Address
                                            Text(
                                              'Home Address',
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

                        // ==================== Continue button ====================
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 24, 50, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              JobDetailsPressed(
                                  color: constants.hrPrimary, borderRadius: 20),
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
