import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/admin_confirm_archive_modal.dart';
import 'package:ssi_mis_flutter/global/modals/admin_role_update_modal.dart';
import 'package:intl/intl.dart';

class RoleRecord extends StatelessWidget {
  const RoleRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(48, 0, 48, 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: constants.adminTable,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =================== Data table ====================
            DataTable(
              // ============== Column Data ===============
              columns: [
                //Role ID
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Role ID',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Role Name
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Role Name',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Date Created
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Date Created',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),

                //Action
                DataColumn(
                  label: Flexible(
                    child: Center(
                      child: Text(
                        'Action',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                      ),
                    ),
                  ),
                ),
              ],

              // ============== Row Data ===============
              rows: roleData.map(
                (roleData) {
                  return DataRow(
                    cells: [
                      //ID
                      DataCell(
                        Center(
                          child: Text(
                            roleData.roleID.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Role Name
                      DataCell(
                        Center(
                          child: SizedBox(
                            width: 150,
                            child: Text(
                              roleData.roleName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                      //Date Created
                      DataCell(
                        Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy')
                                .format(roleData.dateCreated)
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextBlack,
                                ),
                          ),
                        ),
                      ),

                      //Actions
                      const DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoleUpdate(),
                              ConfirmArchive(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
              headingTextStyle: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class RoleData {
  final int roleID;
  final String roleName;
  final DateTime dateCreated;

  RoleData({
    required this.roleID,
    required this.roleName,
    required this.dateCreated,
  });
}

// ========================== Sample Table Data ==========================

final List<RoleData> roleData = [
  RoleData(
    roleID: 0001,
    roleName: "Admin",
    dateCreated: DateTime(2024, 04, 08),
  ),
  RoleData(
    roleID: 0002,
    roleName: "Human Resources",
    dateCreated: DateTime(2024, 04, 08),
  ),
  RoleData(
    roleID: 0003,
    roleName: "Accounting",
    dateCreated: DateTime(2024, 04, 08),
  ),
  RoleData(
    roleID: 0004,
    roleName: "Supervisor",
    dateCreated: DateTime(2024, 04, 08),
  ),
  RoleData(
    roleID: 0005,
    roleName: "Manager",
    dateCreated: DateTime(2024, 04, 08),
  ),
  RoleData(
    roleID: 0006,
    roleName: "Employee",
    dateCreated: DateTime(2024, 04, 08),
  ),
];
