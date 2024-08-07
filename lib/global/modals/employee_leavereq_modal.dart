import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:file_picker/file_picker.dart';

class EmployeeCreateLeave extends StatelessWidget {
  const EmployeeCreateLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return empCreateLeave(context);
  }
}

empCreateLeave(BuildContext context) {
  // String selectedStatus = 'for final approval';
  String selectedLeave = 'sick leave';
  // String selectedDepartment = 'it';

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
            contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
            content: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //
                  // ====================== Header ======================
                  Row(
                    children: [
                      Text(
                        "Leave Request Form",
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
                        "53789",
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

                  // ============================ Leave Details ============================
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          "Leave Details:",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  //
                  // ============ Emp Name ============
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // const Text(
                              //   "Employee Name:",
                              // ),
                              // const SizedBox(width: 29),
                              // const SizedBox(
                              //   width: 175,
                              //   child: TextField(
                              //     keyboardType: TextInputType.multiline,
                              //     style: TextStyle(
                              //       fontSize: 13,
                              //     ),
                              //     decoration: InputDecoration(
                              //       contentPadding:
                              //           EdgeInsets.symmetric(vertical: 10),
                              //       isDense: true,
                              //       enabledBorder: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(8.5),
                              //         ),
                              //         borderSide: BorderSide.none,
                              //       ),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(8.5),
                              //         ),
                              //         borderSide: BorderSide.none,
                              //       ),
                              //       fillColor:
                              //           Color.fromARGB(255, 216, 212, 221),
                              //       filled: true,
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(width: 80),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Leave Type:",
                                  ),
                                  const SizedBox(width: 65),
                                  // ============ Dropdown =============
                                  SizedBox(
                                    width: 172,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: selectedLeave,
                                      items: leaveTypeDropDownItems,
                                      onChanged: (String? newValue) {
                                        selectedLeave = newValue!;
                                      },
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: constants.mainTextBlack),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 80),

                      //
                      //============== Department ================
                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         const Text(
                      //           "Department:",
                      //         ),
                      //         const SizedBox(width: 29),
                      //         SizedBox(
                      //           width: 145,
                      //           child: DropdownButton(
                      //             isExpanded: true,
                      //             value: selectedDepartment,
                      //             items: departmentDropDownItems,
                      //             onChanged: (String? newValue) {
                      //               selectedDepartment = newValue!;
                      //             },
                      //             borderRadius: const BorderRadius.all(
                      //               Radius.circular(10),
                      //             ),
                      //             style: Theme.of(context)
                      //                 .textTheme
                      //                 .bodyMedium
                      //                 ?.copyWith(
                      //                     color: constants.mainTextBlack),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                  //
                  // ====================== Start Date Selection ======================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Start Date:"),

                      const SizedBox(width: 68),

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("End Date:"),

                          const SizedBox(width: 42),

                          // ========== Date Picker =========
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
                          //
                          //================== Leave Type =======================
                        ],
                      ),
                      //
                      //============================ Status Selection ======================
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
                  const SizedBox(height: 1),

                  // =================== Start Time =================
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Start time:"),
                              const SizedBox(width: 69),

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
                      ),
                      const SizedBox(width: 80),
                      //
                      // ============= End Time =============
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("End time:"),
                              const SizedBox(width: 43),

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
                                    const SizedBox(width: 34),
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
                  //
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
                  // =============== Input Field =================
                  const SizedBox(height: 7),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
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
                  ),
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
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "All", child: Text("All")),
    const DropdownMenuItem(value: "IT", child: Text("IT")),
    const DropdownMenuItem(value: "Accounting", child: Text("Accounting")),
    const DropdownMenuItem(value: "HR", child: Text("HR")),
    const DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get statusDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "for approval", child: Text("For Approval")),
    const DropdownMenuItem(
        value: "for final approval", child: Text("For Final Approval")),
    const DropdownMenuItem(value: "approved", child: Text("Approved")),
    const DropdownMenuItem(value: "declined", child: Text("Declined")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get leaveTypeDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "sick leave", child: Text("Sick Leave")),
    const DropdownMenuItem(
        value: "paternity leave", child: Text("Paternity Leave")),
    const DropdownMenuItem(
        value: "maternity leave", child: Text("Maternity Leave")),
    const DropdownMenuItem(
        value: "half day leave", child: Text("Half Day Leave")),
    const DropdownMenuItem(
        value: "emergency leave", child: Text("Emergency Leave")),
    const DropdownMenuItem(value: "paid leave", child: Text("Paid Leave")),
    const DropdownMenuItem(
        value: "bereavement leave", child: Text("Bereavement Leave")),
    const DropdownMenuItem(
        value: "vacation leave", child: Text("Vacation Leave")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get departmentDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "it", child: Text("IT")),
    const DropdownMenuItem(value: "hr", child: Text("HR")),
    const DropdownMenuItem(value: "accounting", child: Text("Accounting")),
    const DropdownMenuItem(value: "marketing", child: Text("Marketing")),
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
