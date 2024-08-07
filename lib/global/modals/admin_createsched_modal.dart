import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class AdminCreateSchedule extends StatefulWidget {
  const AdminCreateSchedule({
    super.key,
  });

  @override
  State<AdminCreateSchedule> createState() => _AdminCreateScheduleState();
}

//Schedule Type Values
enum ScheduleType {
  flexible("Flexible"),
  semiflexible("Semi-flexible");

  final String text;
  const ScheduleType(this.text);
}

class _AdminCreateScheduleState extends State<AdminCreateSchedule> {
  List scheduleOptions = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  List selectedOptions = [];
  ScheduleType? _selectedScheduleType;
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime;

// ========================== DateTime Picker ==========================
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(
          DateTime.now().year + 10, DateTime.now().month, DateTime.now().day),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

// ========================== Time Picker ==========================
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Icon calendarIcon = Icon(
      Icons.calendar_today_rounded,
      color: constants.mainTextBlack,
      size: 15,
    );
    const Icon timeIcon = Icon(
      Icons.schedule_rounded,
      color: constants.mainTextBlack,
      size: 15,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 60, 48, 12),
      child: AlertDialog(
        content: SizedBox(
          //width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 36, 48, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Schedule Label
                  Text(
                    "Schedule Details",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: constants.mainTextBlack,
                        fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 14),

                  //Divider
                  Divider(
                    height: 5,
                    thickness: 1,
                    color: constants.lightGray.withOpacity(0.2),
                  ),

                  const SizedBox(height: 24),

                  // ============================ Schedule Fields ============================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ============== Start Date, End Date, Rest Day Column ==============
                      Expanded(
                        child: Column(
                          children: [
                            // ================= Start Date Row ==================
                            Row(
                              children: [
                                Text(
                                  "Start Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),

                                const SizedBox(width: 12),

                                // Field
                                InputContainer(
                                    onPressed: () async {
                                      await _selectDate(context);
                                      setState(() {
                                        startDate = selectedDate;
                                      });
                                    },
                                    selectedDate: startDate,
                                    hintText: "select date",
                                    type: 1,
                                    icon: calendarIcon),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= End Date Row ==================
                            Row(
                              children: [
                                Text(
                                  "End Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),

                                const SizedBox(width: 16),

                                // Field
                                InputContainer(
                                    onPressed: () async {
                                      await _selectDate(context);
                                      setState(() {
                                        endDate = selectedDate;
                                      });
                                    },
                                    selectedDate: endDate,
                                    hintText: "select date",
                                    type: 1,
                                    icon: calendarIcon),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= Rest Day Row ==================
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rest Day:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),

                                const SizedBox(width: 16),

                                //Checkbox
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: scheduleOptions.map((option) {
                                        return ListTileTheme(
                                          horizontalTitleGap: 12,
                                          child: CheckboxListTile(
                                            title: Text(
                                              option,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: constants
                                                          .mainTextBlack),
                                            ),
                                            value: selectedOptions.contains(
                                                option), //true or false
                                            onChanged: (bool? value) {
                                              setState(() {
                                                if (value == true) {
                                                  if (selectedOptions.length <
                                                      2) {
                                                    selectedOptions.add(option);
                                                  }
                                                } else {
                                                  selectedOptions
                                                      .remove(option);
                                                }
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            dense: true,
                                            visualDensity: const VisualDensity(
                                                horizontal: -4, vertical: -4),
                                            side: const BorderSide(
                                                color: constants.lightGray),
                                            activeColor: constants.adminBtn,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 70),

                      // ============== Start Time, End Time, Sched Type Column ==============
                      Expanded(
                        child: Column(
                          children: [
                            // ================= Start Time Row ==================
                            Row(
                              children: [
                                // Start Time
                                Text(
                                  "Start Time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),

                                const SizedBox(width: 12),

                                // Field
                                InputContainer(
                                    onPressed: () async {
                                      await _selectTime(context);
                                      setState(() {
                                        startTime = selectedTime;
                                      });
                                    },
                                    selectedTime: startTime,
                                    hintText: "select time",
                                    type: 2,
                                    icon: timeIcon),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= End Time Row ==================
                            Row(
                              children: [
                                Text(
                                  "End Time:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),

                                const SizedBox(width: 19),

                                // Field
                                InputContainer(
                                    onPressed: () async {
                                      await _selectTime(context);
                                      setState(() {
                                        endTime = selectedTime;
                                      });
                                    },
                                    selectedTime: endTime,
                                    hintText: "select time",
                                    type: 2,
                                    icon: timeIcon),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= Sched Type Row ==================
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Schedule Type:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                    softWrap: true,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    children: ScheduleType.values
                                        .map((option) => ListTileTheme(
                                              horizontalTitleGap: 12,
                                              child:
                                                  RadioListTile<ScheduleType>(
                                                title: Text(option.text),
                                                value: option,
                                                groupValue:
                                                    _selectedScheduleType,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedScheduleType =
                                                        value!;
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                                dense: true,
                                                visualDensity:
                                                    const VisualDensity(
                                                        horizontal: -4,
                                                        vertical: -4),
                                                activeColor: constants.adminBtn,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),

        // ============================ Create & Cancel Button ============================
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Cancel
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminCloseBtn,
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

              //Create
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminBtn,
                label: const Text(
                  "Create",
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

class InputContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String hintText;
  final Icon icon;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final int? type;

  const InputContainer({
    super.key,
    required this.onPressed,
    required this.hintText,
    required this.icon,
    this.selectedDate,
    this.selectedTime,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.only(left: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: constants.backgroundBtn,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            type == 1
                ? selectedDate == null
                    ? Text(
                        hintText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: constants.lightGray,
                            fontStyle: FontStyle.italic),
                      )
                    : Text(
                        DateFormat('MM/dd/yyyy')
                            .format(selectedDate!)
                            .toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: constants.mainTextBlack,
                            ),
                      )
                : selectedTime == null
                    ? Text(
                        hintText,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: constants.lightGray,
                            fontStyle: FontStyle.italic),
                      )
                    : Text(
                        selectedTime!.format(context),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: constants.mainTextBlack,
                            ),
                      ),

            const SizedBox(width: 36),

            //Icon
            Container(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              decoration: BoxDecoration(
                color: constants.lightGray.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
