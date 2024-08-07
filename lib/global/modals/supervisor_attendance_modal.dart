import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/attendance_screen/admin_attendance_screen.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/printing/supervisor/print_all_attendance.dart';

class SupervisorAttendanceModal extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  static var startDate;

  const SupervisorAttendanceModal({super.key});

  @override
  State<SupervisorAttendanceModal> createState() =>
      _SupervisorAttendanceModalState();
}

class _SupervisorAttendanceModalState extends State<SupervisorAttendanceModal> {
  String? selectedDept;
  DateTime? selectedDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  Iterable<Attendance> filteredList = [];
  bool? isStartDateNull;
  bool? isEndDateNull;
  bool? isDeptNull;
  bool? isStartDateValid;
  bool? isEndDateValid;
  String? errorTextSD;
  String? errorTextED;

  final _formKey = GlobalKey<FormState>();

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 600)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AlertDialog(
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: constants.mainTextBlack),
        title: const Text(
          "Select a Department",
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
        content: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ====================== Department Selection ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Department:",
                    ),

                    const SizedBox(width: 24),

                    //
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Department Dropdown
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 214, 214, 214)
                                  .withOpacity(0.2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: DropdownButtonFormField(
                              value: selectedDept,
                              items: dropdownItems,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDept = newValue!;
                                  isDeptNull = false;
                                });
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                              borderRadius: BorderRadius.circular(8),
                              isDense: true,
                              autofocus: false,
                              alignment: AlignmentDirectional.centerStart,
                              hint: Text(
                                "Select department  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: constants.lightGray,
                                        fontStyle: FontStyle.italic),
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 4, 8),
                              ),
                              focusColor: Colors.transparent,
                            ),
                          ),

                          // // error text
                          // isDeptNull == true
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(left: 12),
                          //         child: Text(
                          //           'field required',
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodySmall
                          //               ?.copyWith(color: constants.errorText),
                          //         ),
                          //       )
                          //     : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // ====================== Start Date Selection ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("From:"),

                    const SizedBox(width: 68),

                    //
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Start Date Picker
                          ElevatedButton(
                            onPressed: () async {
                              await _selectDate(context);
                              setState(() {
                                startDate = selectedDate;

                                if (endDate != null &&
                                    startDate!.isAfter(endDate!)) {
                                  setState(() {
                                    isStartDateValid = false;
                                    errorTextSD = 'invalid date';
                                  });
                                  startDate = null;
                                } else {
                                  isStartDateValid = true;
                                }

                                if (startDate != null) {
                                  isStartDateNull = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding:
                                  const EdgeInsets.fromLTRB(12, 14, 12, 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                startDate == null
                                    ? Text(
                                        'select date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      )
                                    : Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(startDate!)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                const SizedBox(width: 14),
                                const Icon(
                                  Icons.calendar_today_rounded,
                                  color: constants.mainTextBlack,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),

                          // // error text
                          // isStartDateNull == true || isStartDateValid == false
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(left: 12),
                          //         child: Text(
                          //           errorTextSD ?? " ",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodySmall
                          //               ?.copyWith(color: constants.errorText),
                          //         ),
                          //       )
                          //     : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ====================== End Date Selection ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("To:"),

                    const SizedBox(width: 85),

                    //
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // End Date Picker
                          ElevatedButton(
                            onPressed: () async {
                              await _selectDate(context);
                              setState(() {
                                endDate = selectedDate;

                                if ((endDate != null && startDate != null) &&
                                    (endDate!.isBefore(startDate!))) {
                                  setState(() {
                                    isEndDateValid = false;
                                    errorTextED = 'invalid date';
                                    endDate = null;
                                  });
                                } else {
                                  isEndDateValid = true;
                                }

                                if (endDate != null) {
                                  isEndDateNull = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding:
                                  const EdgeInsets.fromLTRB(12, 14, 12, 14),
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                endDate == null
                                    ? Text(
                                        'select date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      )
                                    : Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(endDate!)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                const SizedBox(width: 36),
                                const Icon(
                                  Icons.calendar_today_rounded,
                                  color: constants.mainTextBlack,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),

                          // // error text
                          // isEndDateNull == true || isEndDateValid == false
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(left: 12),
                          //         child: Text(
                          //           errorTextED ?? " ",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodySmall
                          //               ?.copyWith(color: constants.errorText),
                          //         ),
                          //       )
                          //     : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // ====================== Action Buttons ======================
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ======== Cancel Button =======
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.lightGray,
                label: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: constants.mainTextWhite,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                borderRadius: 20,
              ),

              // ======== Generate Button =======
              CustomElevatedButton(
                onPressed: () {
                  // if (startDate == null) {
                  //   setState(() {
                  //     isStartDateNull = true;
                  //     errorTextSD = 'field required';
                  //   });
                  // }
                  // if (endDate == null) {
                  //   setState(() {
                  //     isEndDateNull = true;
                  //     errorTextED = 'field required';
                  //   });
                  // }
                  // if (selectedDept == null) {
                  //   setState(() {
                  //     isDeptNull = true;
                  //   });
                  // }
                  // if (selectedDept != null &&
                  //     startDate != null &&
                  //     endDate != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SupervisorPrintAllAttendance(
                        startDate: startDate,
                        endDate: endDate,
                        dept: selectedDept,
                      );
                    },
                  );
                  //   }
                },
                color: constants.supervisorBtn,
                label: const Text(
                  "Generate",
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
    );
  }
}

// ========================== Sample Department Dropdown ==========================
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
