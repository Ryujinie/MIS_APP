import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/schedule_screen/hr_sched_archived.dart';
import 'package:ssi_mis_flutter/features/screens/schedule_screen/hr_sched_records.dart';
import 'package:ssi_mis_flutter/global/tabviews/hr_tabview.dart';
// import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
// import 'package:ssi_mis_flutter/global/modals/admin_createsched_modal.dart';

class HRScheduleScreen extends StatefulWidget {
  const HRScheduleScreen({super.key});

  @override
  State<HRScheduleScreen> createState() => _HRScheduleScreenState();
}

class _HRScheduleScreenState extends State<HRScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          //======================= Search Bar, Date Filter, Create Sched =====================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //=============== Search Employee ================
                  Container(
                    height: 30,
                    width: 300,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: constants.adminFilter,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search Employee',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: constants.lightGray,
                                  fontWeight: FontWeight.w300,
                                ),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.search,
                            color: constants.lightGray,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 4),

                  // =============== Date Filter ================
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: constants.adminFilter,
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.all(8),
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        Icons.calendar_month_rounded,
                        color: constants.darkGray,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),

              // =============== Create Schedule ================
              //     CustomElevatedButton(
              //       onPressed: () {
              //         createSchedule(context);
              //       },
              //       color: constants.adminBtnGreen,
              //       borderRadius: 8,
              //       label: const Text(
              //         "Create Schedule",
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: constants.mainTextWhite,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //     ),
            ],
          ),

          const SizedBox(height: 12),

          // ====================== TabBar =======================
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: constants.adminTable,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: DefaultTabController(
                length: _tabViews.length,
                child: Column(
                  children: [
                    // ================== Tabs ===================
                    const HRTab(
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Archived'),
                      ],
                    ),

                    // =============== TabBar View ================
                    Expanded(
                      child: TabBarView(children: _tabViews),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Widget> _tabViews = [
  const HRSchedRecords(),
  const HRSchedArchived(),
];

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
