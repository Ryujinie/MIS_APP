import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';
import 'package:ssi_mis_flutter/global/buttons/archive_button.dart';
import 'package:ssi_mis_flutter/global/buttons/edit_button.dart';
import 'package:ssi_mis_flutter/global/modals/admin_confirm_archive_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_department_create_modal.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/admin_department_update_modal.dart';
import 'package:ssi_mis_flutter/global/tabviews/admin_tabview.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class AdminDepartmentScreen extends StatefulWidget {
  const AdminDepartmentScreen({super.key});

  @override
  State<AdminDepartmentScreen> createState() => _AdminDepartmentScreenState();
}

class _AdminDepartmentScreenState extends State<AdminDepartmentScreen> {
  // with SingleTickerProviderStateMixin
  final DepartmentController _departmentController = DepartmentController();
  //late TabController _tabController;
  String deptName = "";

  @override
  void initState() {
    super.initState();
    _departmentController.setStream();
    _departmentController.fetchDataByArchived("false"); // Initial fetch
    //_tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _departmentController.closeStream();
    //_tabController.dispose();
    super.dispose();
  }

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
              Row(
                children: [
                  Searchbar(
                    hintText: "Search department...",
                    controller: _departmentController,
                  ),
                  // CustomElevatedButton(
                  //   onPressed: () async {
                  //     if (searchVal != "") {
                  //       _departmentController.searchDeptByArchived(searchVal);
                  //       _departmentController.onSearched = true;
                  //     }
                  //   },
                  //   color: constants.adminBtn,
                  //   borderRadius: 8,
                  //   icon: const Icon(Icons.search),
                  // ),
                  // CloseButton(
                  //   color: constants.darkGray,
                  //   onPressed: () {
                  //     _departmentController.fetchDataByArchived(
                  //         _departmentController.archiveVal);
                  //     _departmentController.onSearched = false;
                  //     searchVal = "";
                  //   },
                  // ),
                ],
              ),

              // =============== Create Department ================
              CustomElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AdminCreateDepartment(
                          controller: _departmentController);
                    },
                  );
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
                length: 2,
                child: Column(
                  children: [
                    const AdminTab(
                      //tabController: _tabController,
                      tabs: [
                        Tab(text: 'List'),
                        Tab(text: 'Archived'),
                      ],
                    ),
                    // =============== TabBar View ================
                    Expanded(
                      child: TabBarView(
                          //controller: _tabController,
                          children: [
                            ListTab(
                                departmentController: _departmentController),
                            ArchivedTab(
                              departmentController: _departmentController,
                            ),
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

class ListTab extends StatefulWidget {
  final DepartmentController departmentController;

  const ListTab({required this.departmentController, super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  void initState() {
    widget.departmentController.setArchived("false");
    widget.departmentController.fetchDataByArchived("false");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: constants.adminTable,
        ),
        child: StreamBuilder<List<dynamic>>(
          stream: widget.departmentController.getDataStream(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Data Table
                  const DepartmentDataTable(departments: []),

                  const SizedBox(height: 24),

                  // error message
                  Center(
                      child: Text(
                    "${snapshot.error}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: constants.lightGray),
                  )),
                ],
              );
            } else if (snapshot.hasData) {
              final departments = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Data table
                  DepartmentDataTable(
                    departments: departments,
                    departmentController: widget.departmentController,
                  ),

                  //
                  const SizedBox(height: 4),

                  // no department found
                  departments.isEmpty
                      ? Center(
                          child: Text(
                            "No department found",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: constants.lightGray),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            } else {
              return Center(
                child: Text(
                  "Failed to load departments",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: constants.lightGray),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ArchivedTab extends StatefulWidget {
  final DepartmentController departmentController;

  const ArchivedTab({required this.departmentController, super.key});

  @override
  State<ArchivedTab> createState() => _ArchivedTabState();
}

class _ArchivedTabState extends State<ArchivedTab> {
  @override
  void initState() {
    widget.departmentController.setArchived("true");
    widget.departmentController.fetchDataByArchived("true");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: constants.adminTable,
        ),
        child: StreamBuilder<List<dynamic>>(
          stream: widget.departmentController.getDataStream(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Data Table
                  const DepartmentDataTable(departments: []),
                  const SizedBox(height: 24),

                  // error message
                  Center(
                      child: Text(
                    "${snapshot.error}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: constants.lightGray),
                  )),
                ],
              );
            } else if (snapshot.hasData) {
              final departments = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Data table
                  DepartmentDataTable(
                    departments: departments,
                    departmentController: widget.departmentController,
                  ),
                  const SizedBox(height: 4),

                  // empty message
                  departments.isEmpty
                      ? Center(
                          child: Text(
                            "No department found",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: constants.lightGray),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            } else {
              return Center(
                child: Text(
                  "Failed to load departments",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: constants.lightGray),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class DepartmentDataTable extends StatelessWidget {
  final List<dynamic> departments;
  final DepartmentController? departmentController;

  const DepartmentDataTable({
    super.key,
    required this.departments,
    this.departmentController,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Flexible(
            child: Center(
              child: Text(
                'Department ID',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: constants.mainTextBlack,
                    ),
              ),
            ),
          ),
        ),
        DataColumn(
          label: Flexible(
            child: Center(
              child: Text(
                'Department Name',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: constants.mainTextBlack,
                    ),
              ),
            ),
          ),
        ),
        DataColumn(
          label: Flexible(
            child: Center(
              child: Text(
                'Date Created',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: constants.mainTextBlack,
                    ),
              ),
            ),
          ),
        ),
        DataColumn(
          label: Flexible(
            child: Center(
              child: Text(
                'Action',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: constants.mainTextBlack,
                    ),
              ),
            ),
          ),
        ),
      ],
      rows: departments.map((dept) {
        return DataRow(
          cells: [
            DataCell(
              Center(
                child: Text(
                  dept['deptid'].toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: constants.mainTextBlack),
                ),
              ),
            ),
            DataCell(
              Center(
                child: SizedBox(
                  width: 150,
                  child: Text(
                    dept['name'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: constants.mainTextBlack),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Text(
                  DateFormat('MM/dd/yyyy')
                      .format(DateTime.parse(dept['createdat']).toLocal())
                      .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: constants.mainTextBlack),
                ),
              ),
            ),
            DataCell(
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Edit
                    EditButton(onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DepartmentUpdate(
                                deptID: dept['_id'],
                                controller: departmentController);
                          });
                    }),

                    // Archive
                    ArchiveButton(onPressed: () async {
                      int? action = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ConfirmArchive();
                          });

                      if (action == 1) {
                        await departmentController!
                            .archiveDept(dept['_id'], true);
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
      headingTextStyle: Theme.of(context).textTheme.titleMedium,
    );
  }
}
