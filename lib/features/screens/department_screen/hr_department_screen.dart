import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/hr_department_create_modal.dart';
import 'package:ssi_mis_flutter/global/tabviews/hr_tabview.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class HRDepartmentScreen extends StatefulWidget {
  const HRDepartmentScreen({super.key});

  @override
  State<HRDepartmentScreen> createState() => _HRDepartmentScreenState();
}

class _HRDepartmentScreenState extends State<HRDepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          //============================ Action Buttons ============================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  //================ Search Department ================
                  CustomSearchBar(
                    hintText: "Search Department...",
                  ),

                  SizedBox(width: 4),
                ],
              ),

              // =============== Create Department ================
              CustomElevatedButton(
                onPressed: () {
                  hrCreateDepartment(context);
                },
                color: constants.hrBtn,
                borderRadius: 8,
                label: const Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 14,
                    color: constants.mainTextWhite,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ================== TabBar ===================
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
              child: const DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    HRTab(
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Archived'),
                      ],
                    ),
                    // =============== TabBar View ================
                    Expanded(
                      child: TabBarView(children: [
                        //ListTab(departmentController: _departmentController)
                      ]),
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

// final List<Widget> _tabViews = [
//   const DepartmentRecord(),
//   const DepartmentArchived(),
// ];
