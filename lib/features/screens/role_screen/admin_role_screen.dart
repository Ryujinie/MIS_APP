import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/role_screen/admin_role_archived.dart';
import 'package:ssi_mis_flutter/features/screens/role_screen/role_data.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/admin_role_create_modal.dart';
import 'package:ssi_mis_flutter/global/tabviews/admin_tabview.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class AdminRoleScreen extends StatefulWidget {
  const AdminRoleScreen({super.key});

  @override
  State<AdminRoleScreen> createState() => _AdminRoleScreenState();
}

class _AdminRoleScreenState extends State<AdminRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          // ====================== Action Buttons ===================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  // ================ Search Role ================
                  CustomSearchBar(
                    hintText: "Search role...",
                  ),

                  SizedBox(width: 4),
                ],
              ),

              // =============== Create Role ================
              CustomElevatedButton(
                onPressed: () {
                  createRole(context);
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
  const RoleRecord(),
  const RoleArchived(),
];
