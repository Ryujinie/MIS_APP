import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/modals/admin_department_create_modal.dart';
import 'package:ssi_mis_flutter/features/screens/department_screen/department_data.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/department_screen/admin_department_archived.dart';
import 'package:ssi_mis_flutter/global/tabviews/admin_tabview.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class AdminDepartmentScreen extends StatefulWidget {
  const AdminDepartmentScreen({super.key});

  @override
  State<AdminDepartmentScreen> createState() => _AdminDepartmentScreenState();
}

class _AdminDepartmentScreenState extends State<AdminDepartmentScreen> {
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
                  // ================ Search Department ================
                  CustomSearchBar(
                    hintText: "Search department...",
                  ),

                  SizedBox(width: 4),
                ],
              ),

              // =============== Create Department ================
              CustomElevatedButton(
                onPressed: () {
                  createDepartment(context);
                },
                color: constants.adminBtnGreen,
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
              child: DefaultTabController(
                length: _tabViews.length,
                child: Column(
                  children: [
                    const AdminTab(
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
  const DepartmentRecord(),
  const DepartmentArchived(),
];
