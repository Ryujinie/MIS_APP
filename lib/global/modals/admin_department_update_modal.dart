// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class DepartmentUpdate extends StatefulWidget {
  final DepartmentController? controller;
  final String? deptID;

  const DepartmentUpdate({super.key, this.controller, this.deptID});

  // final String deptID;

  @override
  State<DepartmentUpdate> createState() => _DepartmentUpdateState();
}

class _DepartmentUpdateState extends State<DepartmentUpdate> {
  String deptName = "";
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 300,
        //height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //====================== Header ===============//
            Row(
              children: [
                Text(
                  "Department",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: constants.mainTextBlack,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CloseButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: constants.adminBtn,
                    ),
                  ),
                )
              ],
            ),

            // Divider
            const Padding(
              padding: EdgeInsets.only(top: 2, bottom: 15),
              child: Divider(
                color: constants.darkGray,
                thickness: 0.5,
              ),
            ),
            Row(
              children: [
                Text(
                  "Update Department",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: constants.mainTextBlack, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
              height: 15,
            ),
            //========================== Text Field ==========================//
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: constants.lightGray.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  onChanged: (newVal) {
                    deptName = newVal;
                  },
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            //invalid message
            errorMessage != ""
                ? Text(
                    errorMessage,
                    style: const TextStyle(color: constants.errorText),
                  )
                : const SizedBox(),
          ],
        ),
      ),

      //=============== Action Button =============//
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              onPressed: () async {
                var result = await widget.controller!
                    .updateDept(widget.deptID!, deptName);

                if (result != null) {
                  setState(() {
                    errorMessage = result.toString();
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              color: constants.adminBtnGreen,
              label: const Text(
                "Save",
                style: TextStyle(
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
