import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/features/screens/attendance_screen/manager_attendance_screen.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/printing/admin/print_all_attendance.dart';

class ManagerGenerateAttendance extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  static var startDate;

  const ManagerGenerateAttendance({super.key});

  @override
  State<ManagerGenerateAttendance> createState() =>
      _ManagerGenerateAttendanceState();
}

class _ManagerGenerateAttendanceState extends State<ManagerGenerateAttendance> {
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
    // ========================= Font Styles =========================
    final TextStyle? bodyText = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: constants.mainTextBlack);

    final TextStyle? hintText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.lightGray,
            );

    // final TextStyle? invalidText =
    //     Theme.of(context).textTheme.bodyMedium?.copyWith(
    //           color: constants.errorText,
    //           fontStyle: FontStyle.italic,
    //         );

    final TextStyle? buttonText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextWhite,
            );

    //
    return SizedBox(
      width: double.infinity,
      // ========================= Alert Dialog =========================
      child: AlertDialog(
        //
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: constants.mainTextBlack),

        // title
        title: const Text(
          "Select a Department",
          textAlign: TextAlign.center,
        ),
        //
        contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),

        // content
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ================================= Department Row =================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Department
                  Text(
                    "Department:",
                    style: bodyText,
                  ),

                  const SizedBox(width: 24),

                  Expanded(
                    // ====================== Department Column ======================
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
                              style: hintText,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(12, 8, 4, 8),
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
                        //           style: invalidText,
                        //         ),
                        //       )
                        //     : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              //  ================================= Start Date Row =================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From:",
                    style: bodyText,
                  ),

                  const SizedBox(width: 68),

                  //
                  Expanded(
                    // ====================== Start Date Column ======================
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Start Date Picker
                        ElevatedButton(
                          onPressed: () async {
                            await _selectDate(context);
                            setState(() {
                              startDate = selectedDate;

                              // if (endDate != null &&
                              //     startDate!.isAfter(endDate!)) {
                              //   setState(() {
                              //     isStartDateValid = false;
                              //     errorTextSD = 'invalid date';
                              //   });
                              //   startDate = null;
                              // } else {
                              //   isStartDateValid = true;
                              // }

                              // if (startDate != null) {
                              //   isStartDateNull = false;
                              // }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
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
                                      style: hintText,
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

                        // // error display
                        // isStartDateNull == true || isStartDateValid == false
                        //     ? Padding(
                        //         padding: const EdgeInsets.only(left: 12),
                        //         child: Text(
                        //           errorTextSD ?? " ",
                        //           style: invalidText,
                        //         ),
                        //       )
                        //     : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              //  ================================= End Date Row =================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "To:",
                    style: bodyText,
                  ),

                  const SizedBox(width: 85),

                  //
                  Expanded(
                    // ====================== End Date Column ======================
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // End Date Picker
                        ElevatedButton(
                          onPressed: () async {
                            await _selectDate(context);
                            setState(() {
                              endDate = selectedDate;

                              // if ((endDate != null && startDate != null) &&
                              //     (endDate!.isBefore(startDate!))) {
                              //   setState(() {
                              //     isEndDateValid = false;
                              //     errorTextED = 'invalid date';
                              //     endDate = null;
                              //   });
                              // } else {
                              //   isEndDateValid = true;
                              // }

                              // if (endDate != null) {
                              //   isEndDateNull = false;
                              // }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
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
                                      style: hintText,
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

                        // // error display
                        // isEndDateNull == true || isEndDateValid == false
                        //     ? Padding(
                        //         padding: const EdgeInsets.only(left: 12),
                        //         child: Text(
                        //           errorTextED ?? " ",
                        //           style: invalidText,
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

        // =================================== Action Buttons ===================================
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ======== Cancel Button =======
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.lightGray,
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Cancel",
                    style: buttonText,
                  ),
                ),
                borderRadius: 20,
              ),

              const SizedBox(width: 24),

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
                      return PrintAllAttendance(
                        startDate: startDate,
                        endDate: endDate,
                        dept: selectedDept,
                      );
                    },
                  );
                  //}
                },
                color: constants.adminBtn,
                label: Text(
                  "Generate",
                  style: buttonText,
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
