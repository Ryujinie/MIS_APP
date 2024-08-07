import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';

class ManagerViewSchedule extends StatefulWidget {
  const ManagerViewSchedule({super.key});

  @override
  State<ManagerViewSchedule> createState() => _ManagerViewScheduleState();
}

//Schedule Type Values
enum ScheduleType {
  flexible("Flexible"),
  semiflexible("Semi-flexible");

  final String text;
  const ScheduleType(this.text);
}

class _ManagerViewScheduleState extends State<ManagerViewSchedule> {
  bool isClicked = false;
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
  Future _selectDate(BuildContext context) async {
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
    final TextStyle? labelStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextBlack,
            );
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextBlack,
              fontWeight: FontWeight.bold,
            );
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

    return AlertDialog(
      content: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // ====================== Schedule Details =======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Schedule Details
                    Text(
                      "Schedule Details:",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: constants.mainTextBlack),
                    ),

                    //Edit Button
                    isClicked == false
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isClicked = true;
                              });
                            },
                            icon: const Icon(Icons.edit),
                            color: constants.lightGray,
                            iconSize: 22,
                          )
                        : const SizedBox(width: 12),
                  ],
                ),

                isClicked == false
                    ? const SizedBox(height: 8)
                    : const SizedBox(height: 16),

                //Divider
                Divider(
                  height: 5,
                  thickness: 1,
                  color: constants.lightGray.withOpacity(0.2),
                ),

                const SizedBox(height: 24),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ============ Start Date, End Date, Rest Day Column  ===========
                    Expanded(
                      child: Column(
                        children: [
                          // =============== Start Date Row ===============
                          Row(
                            children: [
                              // Start Date
                              Text(
                                "Start Date:",
                                style: labelStyle,
                              ),

                              const SizedBox(width: 12),

                              // Field
                              isClicked == false
                                  ? Text(
                                      "04/01/2024",
                                      style: textStyle,
                                    )
                                  : InputContainer(
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

                          // ================= End Date Row =================
                          Row(
                            children: [
                              // End Date
                              Text(
                                "End Date:",
                                style: labelStyle,
                              ),

                              const SizedBox(width: 16),

                              // Field
                              isClicked == false
                                  ? Text("04/30/2024", style: textStyle)
                                  : InputContainer(
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

                          // ================= Rest Day Row =================
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Rest Day
                              Text(
                                "Rest Day:",
                                style: labelStyle,
                                textAlign: TextAlign.left,
                              ),

                              const SizedBox(width: 18),

                              //Field
                              isClicked == false
                                  ? Row(
                                      children: [
                                        Text("Saturday,", style: textStyle),
                                        const SizedBox(width: 8),
                                        Text("Sunday", style: textStyle),
                                      ],
                                    )
                                  : Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children:
                                              scheduleOptions.map((option) {
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
                                                      if (selectedOptions
                                                              .length <
                                                          2) {
                                                        selectedOptions
                                                            .add(option);
                                                      }
                                                    } else {
                                                      selectedOptions
                                                          .remove(option);
                                                    }
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

                    const SizedBox(width: 40),

                    // ============== Start Time, End Time, Sched Type Column  =============
                    Expanded(
                      child: Column(
                        children: [
                          // ================== Start Time Row ==================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Start time
                              Text(
                                "Start Time:",
                                style: labelStyle,
                              ),

                              const SizedBox(width: 48),

                              // Field
                              isClicked == false
                                  ? Text(
                                      "9:00 AM",
                                      style: textStyle,
                                    )
                                  : InputContainer(
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

                          // =============== End Time Row ===============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //End Time
                              Text(
                                "End Time:",
                                style: labelStyle,
                              ),

                              const SizedBox(width: 53),

                              //Field
                              isClicked == false
                                  ? Row(
                                      children: [
                                        Text(
                                          "6:00 PM",
                                          style: textStyle,
                                        ),
                                        const SizedBox(width: 2),
                                      ],
                                    )
                                  : InputContainer(
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

                          // =============== Sched Type Row ===============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //End Time
                              Text(
                                "Schedule Type:",
                                style: labelStyle,
                              ),

                              const SizedBox(width: 20),

                              //Field
                              isClicked == false
                                  ? Row(
                                      children: [
                                        Text(
                                          "Flexible",
                                          style: textStyle,
                                        ),
                                        const SizedBox(width: 5),
                                      ],
                                    )
                                  : Expanded(
                                      child: Column(
                                        children: ScheduleType.values
                                            .map((option) => ListTileTheme(
                                                  horizontalTitleGap: 12,
                                                  child: RadioListTile<
                                                      ScheduleType>(
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
                                                    activeColor:
                                                        constants.adminBtn,
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
                )
              ],
            ),
          ),
        ),
      ),

      // ============================ Action Buttons ============================
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Close
            CustomElevatedButton(
              onPressed: () {
                isClicked == false
                    ? Navigator.of(context).pop()
                    : setState(() {
                        isClicked = false;
                      });
              },
              color: constants.adminCloseBtn,
              label: Text(
                isClicked == false ? "Close" : "Cancel",
                style: const TextStyle(
                  color: constants.mainTextWhite,
                  fontWeight: FontWeight.w400,
                ),
              ),
              borderRadius: 20,
            ),

            isClicked == true ? const SizedBox(width: 24) : Container(),

            //Save
            isClicked == true
                ? CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: constants.adminBtn,
                    label: Text(
                      "Save",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: constants.mainTextWhite,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    borderRadius: 20,
                  )
                : Container(),
          ],
        ),
      ],
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
