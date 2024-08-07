import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:file_picker/file_picker.dart';

class AdminCreateOT extends StatelessWidget {
  const AdminCreateOT({super.key});

  @override
  Widget build(BuildContext context) {
    return createOT(context);
  }
}

createOT(BuildContext context) {
  // String selectedStatus = 'open';
  // String selectedDepartment = 'Marketing';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
          child: AlertDialog(
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: constants.mainTextBlack),
            // title: const Text(
            //   "Select a Department",
            //   textAlign: TextAlign.center,
            // ),
            contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
            content: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ====================== Department Selection ======================

                  Row(
                    children: [
                      Text(
                        "Overtime Request Form",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Text(
                        "Request ID:",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: constants.mainTextBlack, fontSize: 16),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "EMP 001",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: constants.mainTextBlack, fontSize: 16),
                      ),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Divider(
                      color: constants.darkGray,
                      thickness: 0.5,
                    ),
                  ),

                  // ============================ Schedule Details ============================
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          "Overtime Request Details:",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     const Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               "Employee Name:",
                  //             ),
                  //             SizedBox(width: 29),
                  //             SizedBox(
                  //               width: 175,
                  //               child: TextField(
                  //                 keyboardType: TextInputType.multiline,
                  //                 style: TextStyle(
                  //                   fontSize:
                  //                       13, // Adjust the font size as needed
                  //                 ),
                  //                 decoration: InputDecoration(
                  //                   contentPadding:
                  //                       EdgeInsets.symmetric(vertical: 10),
                  //                   isDense: true,
                  //                   enabledBorder: OutlineInputBorder(
                  //                     // Define the border with rounded corners
                  //                     borderRadius: BorderRadius.all(
                  //                       Radius.circular(8.5),
                  //                     ),
                  //                     borderSide: BorderSide.none,
                  //                   ),
                  //                   focusedBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.all(
                  //                       Radius.circular(8.5),
                  //                     ),
                  //                     borderSide: BorderSide.none,
                  //                   ),
                  //                   fillColor:
                  //                       Color.fromARGB(255, 216, 212, 221),
                  //                   filled: true,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ], //children
                  //     ),
                  //     const SizedBox(
                  //       width: 80,
                  //     ),
                  //     Column(
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             const Text(
                  //               "Department:",
                  //             ),
                  //             const SizedBox(width: 29),
                  //             SizedBox(
                  //               width: 145,
                  //               child: DropdownButton(
                  //                 isExpanded: true,
                  //                 value: selectedDepartment,
                  //                 items: departmentdropdownItems,
                  //                 onChanged: (String? newValue) {
                  //                   selectedDepartment = newValue!;
                  //                 },
                  //                 borderRadius: const BorderRadius.all(
                  //                   Radius.circular(10),
                  //                 ),
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyMedium
                  //                     ?.copyWith(
                  //                         color: constants.mainTextBlack),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  const SizedBox(height: 8),
                  // ====================== Start Date Selection ======================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("From:"),

                      const SizedBox(width: 100),

                      // ========== Date Picker ==========
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.only(left: 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'select date',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: constants.lightGray,
                                      fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(width: 35),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                color: constants.lightGray.withOpacity(0.4),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: constants.mainTextBlack,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 80),

                      //============================ Status Selection ======================
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Start time:"),

                              const SizedBox(width: 34),

                              // ========== Time Picker =========
                              ElevatedButton(
                                onPressed: () => _selectTime(context),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.only(left: 52),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'select time',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: constants.lightGray,
                                              fontStyle: FontStyle.italic),
                                    ),
                                    const SizedBox(width: 36),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: constants.lightGray
                                            .withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 6, 8, 6),
                                        child: Icon(
                                          Icons.calendar_today_rounded,
                                          color: constants.mainTextBlack,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ], //children
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     const Text("Status:"),
                      //     const SizedBox(width: 65),
                      //     SizedBox(
                      //       width: 147,
                      //       child: DropdownButton(
                      //         isExpanded: true,
                      //         value: selectedStatus,
                      //         items: statusDropDownItems,
                      //         onChanged: (String? newValue) {
                      //           selectedStatus = newValue!;
                      //         },
                      //         borderRadius:
                      //             const BorderRadius.all(Radius.circular(10)),
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .bodyMedium
                      //             ?.copyWith(color: constants.mainTextBlack),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // ====================== End Date Selection ======================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("To:"),

                      const SizedBox(width: 120),

                      // ========== Date Picker =========
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.only(left: 51),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'select date',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: constants.lightGray,
                                      fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(width: 34),
                            Container(
                              decoration: BoxDecoration(
                                color: constants.lightGray.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: constants.mainTextBlack,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 80),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("End time:"),

                              const SizedBox(width: 40),

                              // ========== Time Picker =========
                              ElevatedButton(
                                onPressed: () => _selectTime(context),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.only(left: 52),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'select time',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: constants.lightGray,
                                              fontStyle: FontStyle.italic),
                                    ),
                                    const SizedBox(width: 36),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: constants.lightGray
                                            .withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 6, 8, 6),
                                        child: Icon(
                                          Icons.calendar_today_rounded,
                                          color: constants.mainTextBlack,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),

                  // ====================== End Date Selection ======================
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     const Text("To:"),

                  //     const SizedBox(width: 120),

                  //     // ========== Date Picker =========
                  //     ElevatedButton(
                  //       onPressed: () => _selectDate(context),
                  //       style: ElevatedButton.styleFrom(
                  //         minimumSize: Size.zero,
                  //         padding: const EdgeInsets.only(left: 51),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'select date',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodySmall
                  //                 ?.copyWith(
                  //                     color: constants.lightGray,
                  //                     fontStyle: FontStyle.italic),
                  //           ),
                  //           const SizedBox(width: 34),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               color: constants.lightGray.withOpacity(0.4),
                  //               borderRadius: const BorderRadius.only(
                  //                 topRight: Radius.circular(8),
                  //                 bottomRight: Radius.circular(8),
                  //               ),
                  //             ),
                  //             child: const Padding(
                  //               padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                  //               child: Icon(
                  //                 Icons.calendar_today_rounded,
                  //                 color: constants.mainTextBlack,
                  //                 size: 15,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 80),
                  //     // Column(
                  //     //   children: [
                  //     //     Row(
                  //     //       mainAxisAlignment: MainAxisAlignment.start,
                  //     //       children: [
                  //     //         const Text("End time:"),

                  //     //         const SizedBox(width: 40),

                  //     //         // ========== Time Picker =========
                  //     //         ElevatedButton(
                  //     //           onPressed: () => _selectTime(context),
                  //     //           style: ElevatedButton.styleFrom(
                  //     //             minimumSize: Size.zero,
                  //     //             padding: const EdgeInsets.only(left: 52),
                  //     //             shape: RoundedRectangleBorder(
                  //     //               borderRadius: BorderRadius.circular(8),
                  //     //             ),
                  //     //           ),
                  //     //           child: Row(
                  //     //             mainAxisAlignment:
                  //     //                 MainAxisAlignment.spaceBetween,
                  //     //             children: [
                  //     //               Text(
                  //     //                 'select time',
                  //     //                 style: Theme.of(context)
                  //     //                     .textTheme
                  //     //                     .bodySmall
                  //     //                     ?.copyWith(
                  //     //                         color: constants.lightGray,
                  //     //                         fontStyle: FontStyle.italic),
                  //     //               ),
                  //     //               const SizedBox(width: 36),
                  //     //               Container(
                  //     //                 decoration: BoxDecoration(
                  //     //                   color: constants.lightGray
                  //     //                       .withOpacity(0.4),
                  //     //                   borderRadius: const BorderRadius.only(
                  //     //                     topRight: Radius.circular(8),
                  //     //                     bottomRight: Radius.circular(8),
                  //     //                   ),
                  //     //                 ),
                  //     //                 child: const Padding(
                  //     //                   padding:
                  //     //                       EdgeInsets.fromLTRB(8, 6, 8, 6),
                  //     //                   child: Icon(
                  //     //                     Icons.calendar_today_rounded,
                  //     //                     color: constants.mainTextBlack,
                  //     //                     size: 15,
                  //     //                   ),
                  //     //                 ),
                  //     //               ),
                  //     //             ],
                  //     //           ),
                  //     //         ),
                  //     //       ],
                  //     //     ),
                  //     //   ],
                  //     // )
                  //   ],
                  // ),
                  const SizedBox(height: 8),
                  // ============================= Reason =============================
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Text(
                        "Reason:",
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: constants.lightGray.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    hintText: 'type here...',
                                    hintStyle: TextStyle(
                                      color: constants.lightGray,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 5,
                              thickness: 1,
                              indent: 5,
                              endIndent: 5,
                              color: constants.lightGray.withOpacity(0.2),
                            ),

                            // ============== Attachment Button =============
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AttachmentButton(
                                  onPressed: () async {
                                    // ignore: unused_local_variable
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                                    );
                                    //print("Attached File: $result");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // ============================ Action Buttons ============================
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: constants.adminBtn,
                    label: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: constants.mainTextWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    borderRadius: 20,
                  ),
                  const SizedBox(width: 24),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: constants.adminBtnGreen,
                    label: const Text(
                      "Save",
                      style: TextStyle(
                        color: constants.mainTextWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    borderRadius: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// ========================== DateTime Picker ==========================
Future<void> _selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
  }
}

// ========================== Sample Dropdown Data ==========================
List<DropdownMenuItem<String>> get departmentdropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "All", child: Text("All")),
    const DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
    const DropdownMenuItem(value: "Engineering", child: Text("Engineering")),
    const DropdownMenuItem(value: "HR", child: Text("HR")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get statusDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "open", child: Text("For Approval")),
    const DropdownMenuItem(
        value: "on progress", child: Text("For Final Approval")),
    const DropdownMenuItem(value: "in review", child: Text("Approved")),
    const DropdownMenuItem(value: "approved", child: Text("Declined")),
  ];
  return menuItems;
}

TimeOfDay? selectedTime;

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null && picked != selectedTime) {}
  // setState(() {
  //  selectedTime = picked;
  //
  //  }
  // );
}
