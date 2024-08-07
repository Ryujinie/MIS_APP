import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';

class SupervisorViewSchedule extends StatefulWidget {
  const SupervisorViewSchedule({super.key});

  @override
  State<SupervisorViewSchedule> createState() => _SupervisorViewScheduleState();
}

//Schedule Type Values
enum ScheduleType {
  flexible("Flexible"),
  semiflexible("Semi-flexible");

  final String text;
  const ScheduleType(this.text);
}

class _SupervisorViewScheduleState extends State<SupervisorViewSchedule> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? labelStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextBlack,
            );
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextBlack,
              fontWeight: FontWeight.bold,
            );

    return AlertDialog(
      content: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ====================== Schedule Details Label =======================
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

                    Row(
                      children: [
                        Text(
                          "ID:",
                          style: labelStyle,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "12342345",
                          style: labelStyle,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                //Divider
                Divider(
                  height: 5,
                  thickness: 1,
                  color: constants.lightGray.withOpacity(0.2),
                ),

                const SizedBox(height: 24),

                // ============================ Schedule Details Row ============================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                "04/08/2024",
                                style: textStyle,
                              )
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
                              Text(
                                "04/30/2024",
                                style: textStyle,
                              ),
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
                              Row(
                                children: [
                                  Text(
                                    "Saturday,",
                                    style: textStyle,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Sunday",
                                    style: textStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 80),

                    // ==================== Start Time, End Time, Sched Type Row  ====================
                    Row(
                      children: [
                        // ====================== Labels Column  ======================
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Start Time
                            Text(
                              "Start Time:",
                              style: labelStyle,
                            ),

                            const SizedBox(height: 12),

                            // End Time
                            Text(
                              "End Time:",
                              style: labelStyle,
                            ),

                            const SizedBox(height: 12),

                            // Schedule Type
                            Text(
                              "Schedule Type:",
                              style: labelStyle,
                            ),
                          ],
                        ),

                        const SizedBox(width: 12),

                        // ====================== Fields Column  ======================
                        Column(
                          children: [
                            // Start Time
                            Text(
                              "9:00 AM",
                              style: textStyle,
                              textAlign: TextAlign.end,
                            ),

                            const SizedBox(height: 12),

                            // End time
                            Text(
                              "6:00 PM",
                              style: textStyle,
                            ),

                            const SizedBox(height: 12),

                            // Schedule Type
                            Text(
                              "Flexible",
                              style: textStyle,
                            ),
                          ],
                        ),
                      ],
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
                Navigator.of(context).pop();
              },
              color: constants.adminCloseBtn,
              label: Text(
                "Close",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: constants.mainTextWhite,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              borderRadius: 20,
            ),
          ],
        ),
      ],
    );
  }
}

// // ========================== Date Picker ==========================
// Future<void> _selectDate(BuildContext context) async {
//   DateTime selectedDate = DateTime.now();
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate,
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//   );
//   if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //       });
//   }
// }

// // ========================== Time Picker ==========================
// Future<void> _selectTime(BuildContext context) async {
//   TimeOfDay? selectedTime;
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//   );
//   if (picked != null && picked != selectedTime) {
// //     setState(() {
// //       // selectedTime = picked;
// //     });
//   }
// }

// class InputContainer extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String hintText;
//   final Icon icon;

//   const InputContainer(
//       {super.key,
//       required this.onPressed,
//       required this.hintText,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ElevatedButton(
//         onPressed: () => _selectDate(context),
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size.zero,
//           padding: const EdgeInsets.only(left: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           backgroundColor: constants.backgroundBtn,
//           elevation: 0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //select date
//             Text(
//               hintText,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: constants.lightGray, fontStyle: FontStyle.italic),
//             ),

//             const SizedBox(width: 36),

//             //Icon
//             Container(
//               padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
//               decoration: BoxDecoration(
//                 color: constants.lightGray.withOpacity(0.4),
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(8),
//                     bottomRight: Radius.circular(8)),
//               ),
//               child: icon,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
