import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class HRAttendanceModal extends StatelessWidget {
  const HRAttendanceModal({super.key});

  @override
  Widget build(BuildContext context) {
    return generateAttendance(context);
  }
}

generateAttendance(BuildContext context) {
  String selectedValue = 'All';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: double.infinity,
        child: AlertDialog(
          titleTextStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: constants.mainTextBlack),
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Select a Department",
                  textAlign: TextAlign.center,
                ),
              ),
            // close button
              CloseButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminBtn,
              ),
            ],
          ),
          contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ====================== Department Selection ======================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Department:"),
                  const SizedBox(width: 24),
                  // ========== Department Dropdown =========
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: constants.lightGray.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: constants.mainTextBlack),
                            borderRadius: BorderRadius.circular(8),
                            isDense: true,
                            focusColor: Colors.transparent,
                            autofocus: false,
                            alignment: AlignmentDirectional.centerStart,
                            value: selectedValue,
                            items: dropdownItems,
                            onChanged: (String? newValue) {
                              selectedValue = newValue!;
                            },
                          ),
                        ),
                      ),
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
                  // ========== Date Picker ==========
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.only(left: 12),
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
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
                          const SizedBox(width: 14),
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
                  // ========== Date Picker =========
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.only(left: 12),
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
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
                          const SizedBox(width: 36),
                          Container(
                            decoration: BoxDecoration(
                              color: constants.lightGray.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
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
                  ),
                ],
              ),
            ],
          ),
          // ====================== Action Buttons ======================
          actions: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminBtnGreen,
                label: const Text(
                  "Generate",
                  style: TextStyle(
                    color: constants.mainTextWhite,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                borderRadius: 20,
              ),
            ),
          ],
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
    // setState(() {
    //   selectedDate = picked;
    // });
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
