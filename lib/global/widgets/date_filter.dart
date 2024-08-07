import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// Date Range Picker
class DateFilter extends StatefulWidget {
  const DateFilter({super.key});

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  late DateTime startDate;
  //= DateTime.now().subtract(const Duration(days: 1));
  late DateTime endDate = DateTime.now();
  //DateTime.now();
  bool isPicked = false;
  final List<DateTime?> _dates = [DateTime.now()];
  int calendarType = 1;

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: () async {
          //
          var picked = await showCalendarDatePicker2Dialog(
            context: context,
            config: CalendarDatePicker2WithActionButtonsConfig(
              calendarType: CalendarDatePicker2Type.range,
            ),
            useSafeArea: true,
            dialogSize: const Size(325, 400),
            value: _dates,
            borderRadius: BorderRadius.circular(15),
            builder: (context, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: child,
                  ),
                ],
              );
            },
          );

          if (picked != null) {
            setState(() {
              startDate = picked.first!;
              endDate = picked.last!;
              isPicked = true;
            });
          }
        },

        // Button Style
        style: ElevatedButton.styleFrom(
          backgroundColor: constants.adminFilter,
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            // calendar icon
            const Icon(
              Icons.calendar_month_rounded,
              color: constants.darkGray,
              size: 16,
            ),

            isPicked == true
                ? Row(
                    children: [
                      const SizedBox(width: 8),

                      // Start Date
                      Text(
                        DateFormat('MM/dd/yyyy').format(startDate).toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: constants.lightGray,
                              fontWeight: FontWeight.w300,
                            ),
                      ),

                      endDate != startDate
                          ? Row(
                              children: [
                                // Hyphen
                                Text(
                                  ' - ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.lightGray,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),

                                // End date
                                Text(
                                  DateFormat('MM/dd/yyyy')
                                      .format(endDate)
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: constants.lightGray,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

//========================== Admin Print Date Picker ==========================
class AdminPrintDatePicker extends StatefulWidget {
  const AdminPrintDatePicker({super.key});

  @override
  State<AdminPrintDatePicker> createState() => _AdminPrintDatePickerState();
}

class _AdminPrintDatePickerState extends State<AdminPrintDatePicker> {
  DateTime? selectedDate;
  bool isPicked = false;

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    // DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      height: 32,
      child: ElevatedButton(
        onPressed: () async {
          _selectDate(context);

          setState(() {
            isPicked = true;
          });
        },

        // Button Style
        style: ElevatedButton.styleFrom(
          backgroundColor: constants.adminFilter,
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            // icon
            const Icon(
              Icons.calendar_month_rounded,
              color: constants.mainTextBlack,
              size: 16,
            ),

            const SizedBox(width: 8),

            // text
            isPicked == true
                ? Text(
                    selectedDate == null
                        ? 'select date'
                        : DateFormat('MM/dd/yyyy')
                            .format(selectedDate!)
                            .toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: constants.mainTextBlack,
                        ),
                  )
                : Text(
                    'select date',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: constants.mainTextBlack,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
          ],
        ),

        // Row(
        //   children: [
        //     const Icon(
        //       Icons.calendar_month_rounded,
        //       color: constants.mainTextBlack,
        //       size: 16,
        //     ),
        //     const SizedBox(width: 8),
        //     isPicked == true
        //         ? Row(
        //             children: [
        //               // Start Date
        //               Text(
        //                 DateFormat('MMM dd yyyy').format(startDate).toString(),
        //                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //                       color: constants.mainTextBlack,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //               ),
        //               endDate != startDate
        //                   ? Row(
        //                       children: [
        //                         // Hyphen
        //                         Text(
        //                           ' - ',
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .bodyMedium
        //                               ?.copyWith(
        //                                 color: constants.mainTextBlack,
        //                                 fontWeight: FontWeight.w400,
        //                               ),
        //                         ),
        //                         // End date
        //                         Text(
        //                           DateFormat('MMM dd yyyy')
        //                               .format(endDate)
        //                               .toString(),
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .bodyMedium
        //                               ?.copyWith(
        //                                 color: constants.mainTextBlack,
        //                                 fontWeight: FontWeight.w400,
        //                               ),
        //                         ),
        //                       ],
        //                     )
        //                   : const SizedBox(),
        //             ],
        //           )
        //         :
        //         // Filter
        // Text(
        //     'Filter',
        //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //           color: constants.mainTextBlack,
        //           fontWeight: FontWeight.w400,
        //         ),
        //   ),
        //   ],
        // ),
      ),
    );
  }
}
