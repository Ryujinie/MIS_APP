import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/schedule_screen/manager_sched_records.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/modals/manager_createsched_modal.dart';

import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class ManagerScheduleScreen extends StatefulWidget {
  const ManagerScheduleScreen({super.key});

  @override
  State<ManagerScheduleScreen> createState() => _ManagerScheduleScreenState();
}

class _ManagerScheduleScreenState extends State<ManagerScheduleScreen> {
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
              const Row(
                children: [
                  //=============== Search Employee ================
                  CustomSearchBar(hintText: 'Search employee'),

                  SizedBox(width: 4),

                  // =============== Date Filter ================
                  DateFilter(),
                ],
              ),

              // =============== Create Schedule ================
              CustomElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ManagerCreateSchedule();
                  },
                ),
                color: constants.mngrPrimary,
                borderRadius: 8,
                label: Text(
                  "Create Schedule",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: constants.mainTextBlack,
                      fontWeight: FontWeight.w400),
                ),
              ),
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
                    // const AdminTab(
                    //   tabs: [
                    //     Tab(text: 'All'),
                    //     Tab(text: 'Archived'),
                    //   ],
                    // ),

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
  const ManagerSchedRecords(),
];
