import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';
// import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class AdminCreateDepartment extends StatefulWidget {
  final DepartmentController? controller;

  const AdminCreateDepartment({this.controller, super.key});

  @override
  State<AdminCreateDepartment> createState() => _AdminCreateDepartmentState();
}

class _AdminCreateDepartmentState extends State<AdminCreateDepartment> {
  String deptName = "";

  late String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 300,
        //height: 145,
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
                        Navigator.pop(context, 0);
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
                  "Enter Department",
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

            errorMessage.isNotEmpty
                ? Text(
                    errorMessage,
                    style: const TextStyle(color: constants.errorText),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Create
            CustomElevatedButton(
              onPressed: () async {
                var response =
                    await widget.controller!.createDepartment(deptName);
                if (response != null) {
                  setState(() {
                    errorMessage = response.toString();
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              color: constants.adminBtnGreen,
              label: const Text(
                "Create",
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
