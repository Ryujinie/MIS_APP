// ignore_for_file: library_prefixes, prefer_const_declarations, avoid_print

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/dropdown_items.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/printing/admin/print_profile_admin.dart';
import 'package:ssi_mis_flutter/global/widgets/dropdownfield.dart';
import 'package:ssi_mis_flutter/global/widgets/textformfield.dart';

const String profileImagePath = 'assets/images/profile_sample.png';

void saveButtonPressed() {
  // Blank button tester
}

// =============== PROFILE TAB - HR EMP MNGMT =============== //
class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({super.key});

  @override
  State<ProfileAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle? headingStyle =
        Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
    final TextStyle? labelStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );

    return Container(
      decoration: const BoxDecoration(
        color: constants.hrTable,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              const SizedBox(height: 12),

              // ====================== Print Button =======================
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const PrintAdminProfile();
                        }),
                    color: constants.adminBtn,
                    label: Column(
                      children: [
                        const SizedBox(height: 2.5),
                        Row(
                          children: [
                            const Icon(
                              Icons.print,
                              color: constants.mainTextWhite,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Print Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextWhite,
                                    //fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2.5),
                      ],
                    ),
                    borderRadius: 8,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ===================== Personal Details Row ==================== //
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: constants.backgroundBtnlightGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // ================= PERSONAL DETAILS HEADING ROW =================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 30),

                        //Personal Details
                        Text(
                          'Personal Details',
                          textAlign: TextAlign.start,
                          style: headingStyle,
                        ),

                        const Spacer(),

                        isClicked == false
                            ?

                            //Edit Button
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isClicked = true;
                                  });
                                },
                                icon: const Icon(Icons.edit),
                                color: constants.lightGray,
                                iconSize: 18,
                              )
                            :

                            //Save button
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isClicked = false;
                                  });
                                },
                                icon: const Icon(Icons.done_all_rounded),
                                color: constants.lightGray,
                                iconSize: 18,
                              ),

                        //Edit
                        Text(
                          isClicked == false ? 'Edit' : 'Save',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: constants.mainTextGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),

                        const SizedBox(width: 30),
                      ],
                    ),

                    //Divider
                    const Divider(
                      thickness: 1.0,
                      color: constants.mainTextGrey,
                    ),

                    const SizedBox(height: 30),

                    // =========================== PERSONAL DETAILS  ROW ===========================
                    Row(
                      children: [
                        // ================== Image, Name, Position Column =================
                        Column(
                          children: [
                            const SizedBox(height: 20),

                            //Image
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: Image.asset(
                                profileImagePath,
                              ),
                            ),

                            const SizedBox(height: 24),

                            //Name
                            SizedBox(
                              child: Text(
                                'Gracie A. Gates',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),

                            //Position
                            SizedBox(
                              child: Text(
                                'Quality Assurance',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: constants.mainTextGrey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        //================== First, Middle, Last Name, Gender Row =================
                        Row(
                          children: [
                            // ==================== Labels Column ====================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //First Name
                                Text(
                                  'First Name',
                                  style: labelStyle,
                                ),

                                const SizedBox(height: 20),

                                //Middle Name
                                Text(
                                  'Middle Name',
                                  style: labelStyle,
                                ),

                                const SizedBox(height: 20),

                                //Last Name
                                Text(
                                  'Last Name',
                                  style: labelStyle,
                                ),

                                const SizedBox(height: 20),

                                //Gender
                                Text(
                                  'Gender',
                                  style: labelStyle,
                                ),
                              ],
                            ),

                            const SizedBox(width: 30),

                            // ==================== Fields Column ====================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //First Name
                                isClicked == false
                                    ? Text(
                                        'Gracie',
                                        style: textStyle,
                                      )
                                    : const CustomTextFormField(
                                        initialValue: 'Gracie', width: 200),

                                const SizedBox(height: 20),

                                //Middle Name
                                isClicked == false
                                    ? Text(
                                        'Appleseed',
                                        style: textStyle,
                                      )
                                    : const CustomTextFormField(
                                        initialValue: 'Appleseed', width: 200),

                                const SizedBox(height: 20),

                                //Last Name
                                isClicked == false
                                    ? Text(
                                        'Gates',
                                        style: textStyle,
                                      )
                                    : const CustomTextFormField(
                                        initialValue: 'Gates', width: 200),

                                const SizedBox(height: 20),

                                //Gender
                                isClicked == false
                                    ? Text(
                                        'Female',
                                        style: textStyle,
                                      )
                                    : CustomDropdownField(
                                        initialValue: 'Female',
                                        width: 200,
                                        dropdownItems: genders,
                                      ),
                              ],
                            ),
                          ],
                        ),

                        isClicked == false
                            ? const SizedBox(width: 90)
                            : const SizedBox(width: 30),

                        // ================== Birthdate, Email, Phone, Address Row =================
                        Expanded(
                          child: Row(
                            children: [
                              // ==================== Labels Column ================
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Date of Birth
                                  Text(
                                    'Date of Birth',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 20),

                                  //Email
                                  Text(
                                    'Email Address',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 20),

                                  //Phone
                                  Text(
                                    'Mobile & Telephone',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 20),

                                  //Address
                                  Text(
                                    'Home Address',
                                    style: labelStyle,
                                  ),
                                ],
                              ),

                              const SizedBox(width: 30),

                              // ==================== Fields Column ================
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Date of Birth
                                    isClicked == false
                                        ? Text(
                                            'April 29 1999',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: 'April 29 1999',
                                            width: 400),

                                    const SizedBox(height: 20),

                                    //Email
                                    isClicked == false
                                        ? Text(
                                            'gracie.gates@email.com',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue:
                                                'gracie.gates@email.com',
                                            width: 400),

                                    const SizedBox(height: 20),

                                    //Phone
                                    isClicked == false
                                        ? Text(
                                            '+63 912 345 6789 | 02 8832 4567',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '+63 912 345 6789',
                                            width: 400),

                                    const SizedBox(height: 20),

                                    //Address
                                    isClicked == false
                                        ? Text(
                                            '73 Bulacan Street, Brgy. Sto. Nino, Manila',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue:
                                                '73 Bulacan Street, Brgy. Sto. Nino, Manila',
                                            width: 400),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // =============== JOB DETAILS, GOV CONTRIBUTIONS, EMERGENCY CONTACT CARDS ===============
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ========================= Job Details Card ========================= //
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: constants.backgroundBtnlightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          // ================ Job Details Heading ================
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              Text(
                                'Job Details',
                                textAlign: TextAlign.start,
                                style: headingStyle,
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 1.0,
                            color: constants.mainTextGrey,
                          ),

                          const SizedBox(height: 10),

                          // ===================== Job Details Row =====================
                          Row(
                            children: [
                              const SizedBox(width: 30),

                              // ==================== Labels Column ================
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Job Position
                                  Text(
                                    'Job Position',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Employment Type
                                  Text(
                                    'Employment Type',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Role
                                  Text(
                                    'Role',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Department
                                  Text(
                                    'Department',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Schedule
                                  Text(
                                    'Schedule',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 24),
                                ],
                              ),

                              const SizedBox(width: 30),

                              // ==================== Fields Column ================
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Job Position
                                    isClicked == false
                                        ? Text(
                                            'Quality Assurance',
                                            style: textStyle,
                                          )
                                        : CustomDropdownField(
                                            initialValue: 'Quality Assurance',
                                            dropdownItems: jobPositions,
                                          ),

                                    const SizedBox(height: 10),

                                    // Employment Type
                                    isClicked == false
                                        ? Text(
                                            'Regular',
                                            style: textStyle,
                                          )
                                        : CustomDropdownField(
                                            initialValue: 'Regular',
                                            dropdownItems: employmentTypes,
                                          ),

                                    const SizedBox(height: 10),

                                    // Role
                                    isClicked == false
                                        ? Text(
                                            'Employee',
                                            style: textStyle,
                                          )
                                        : CustomDropdownField(
                                            initialValue: 'Employee',
                                            dropdownItems: roles,
                                          ),

                                    const SizedBox(height: 10),

                                    // Department
                                    isClicked == false
                                        ? Text(
                                            'IT',
                                            style: textStyle,
                                          )
                                        : CustomDropdownField(
                                            initialValue: 'IT',
                                            dropdownItems: departments,
                                          ),

                                    const SizedBox(height: 10),

                                    // Schedule
                                    isClicked == false
                                        ? Text(
                                            'M,T,W,F,S 08:00AM-5:00PM',
                                            style: textStyle,
                                          )
                                        : CustomDropdownField(
                                            initialValue: 'M,T,W,F,S'
                                                '\n08:00AM-5:00PM',
                                            dropdownItems: schedules,
                                            height: 40,
                                          ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 24),
                            ],
                          ),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // ================== Government Distributions Card ==================
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: constants.backgroundBtnlightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Spacer
                          const SizedBox(height: 10),

                          // ================= Government Contributions Heading =================
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              Text(
                                'Government Contributions',
                                textAlign: TextAlign.start,
                                style: headingStyle,
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 1.0,
                            color: constants.mainTextGrey,
                          ),

                          const SizedBox(height: 10),

                          // ===================== Government Contributions Row =====================
                          Row(
                            children: [
                              const SizedBox(width: 30),

                              // ==================== Labels Column ================
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TIN
                                  Text(
                                    'TIN No.',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // SSS
                                  Text(
                                    'SSS No.',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Philhealth
                                  Text(
                                    'Philhealth No.',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // PAGIBIG
                                  Text(
                                    'PAGIBIG No.',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 24),
                                ],
                              ),

                              const SizedBox(width: 30),

                              // ==================== Fields Column ================
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // TIN
                                    isClicked == false
                                        ? Text(
                                            '000-123-456-001',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '000-123-456-001'),

                                    const SizedBox(height: 10),

                                    // SSS
                                    isClicked == false
                                        ? Text(
                                            '0-123456-7',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '0-123456-7'),

                                    const SizedBox(height: 10),

                                    // PhilHealth
                                    isClicked == false
                                        ? Text(
                                            '0-123456-7',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '0-123456-7'),

                                    const SizedBox(height: 10),

                                    // Pagibig
                                    isClicked == false
                                        ? Text(
                                            '0-123456-7',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '0-123456-7'),

                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // ==================== Emergency Contact Card ==================== //
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: constants.backgroundBtnlightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          // ================= Emergency Contact Heading =================
                          Row(
                            children: [
                              const SizedBox(width: 30),
                              Text(
                                'Emergency Contact',
                                textAlign: TextAlign.start,
                                style: headingStyle,
                              ),
                            ],
                          ),

                          const Divider(
                            thickness: 1.0,
                            color: constants.mainTextGrey,
                          ),

                          const SizedBox(height: 10),

                          // ==================== Emergency Contact Row ====================
                          Row(
                            children: [
                              const SizedBox(width: 30),

                              // ==================== Labels Column ================
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Name
                                  Text(
                                    'Name',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Relationship
                                  Text(
                                    'Relationship',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Contact
                                  Text(
                                    'Contact No.',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 10),

                                  // Address
                                  Text(
                                    'Address',
                                    style: labelStyle,
                                  ),

                                  const SizedBox(height: 20),
                                ],
                              ),

                              const SizedBox(width: 30),

                              // ==================== Fields Column ====================
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name
                                    isClicked == false
                                        ? Text(
                                            'Mika Ombao',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: 'Mika Ombao'),

                                    const SizedBox(height: 10),

                                    // Relationship
                                    isClicked == false
                                        ? Text(
                                            'Mother',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: 'Mother'),

                                    const SizedBox(height: 10),

                                    // Number
                                    isClicked == false
                                        ? Text(
                                            '09081234567',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue: '09081234567'),

                                    const SizedBox(height: 10),

                                    // Address
                                    isClicked == false
                                        ? Text(
                                            '73 Bulacan Street, Brgy. Sto. Nino, Manila',
                                            style: textStyle,
                                          )
                                        : const CustomTextFormField(
                                            initialValue:
                                                '73 Bulacan Street, Brgy. Sto. Nino, Manila'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
