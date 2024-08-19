import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class ConfirmUnarchive extends StatefulWidget {
  final DepartmentController? controller;
  final String? deptID;
  final String? user;

  const ConfirmUnarchive({super.key, this.user, this.controller, this.deptID});

  @override
  State<ConfirmUnarchive> createState() => _ConfirmUnarchiveState();
}

class _ConfirmUnarchiveState extends State<ConfirmUnarchive> {
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: constants.mainTextBlack),
      title: const Text(
        "Restore",
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.fromLTRB(40, 24, 40, 48),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Are you sure you want to restore this record?"),
          const SizedBox(
            height: 4,
          ),
          errorMessage != ""
              ? Text(
                  errorMessage,
                  style: const TextStyle(color: constants.errorText),
                )
              : const SizedBox(),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: constants.lightGray,
              label: Text(
                "Cancel",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: constants.mainTextWhite,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              borderRadius: 20,
            ),
            const SizedBox(width: 24),
            CustomElevatedButton(
              onPressed: () async {
                var result =
                    await widget.controller!.archiveDept(widget.deptID!, false);
                if (result != null) {
                  setState(() {
                    errorMessage = result.toString();
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              color: widget.user == 'admin'
                  ? constants.adminBtn
                  : widget.user == 'employee'
                      ? constants.empBtn
                      : widget.user == 'hr'
                          ? constants.hrBtn
                          : widget.user == 'supervisor'
                              ? constants.supervisorBtn
                              : widget.user == 'manager'
                                  ? constants.mngrBtn
                                  : constants.adminBtnGreen,
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Yes",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: constants.mainTextWhite,
                        fontWeight: FontWeight.w400,
                      ),
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
