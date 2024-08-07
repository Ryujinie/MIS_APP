import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class HRCreateDepartment extends StatelessWidget {
  const HRCreateDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return hrCreateDepartment(context);
  }
}

hrCreateDepartment(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: 300,
          height: 145,
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
                          Navigator.of(context).pop();
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: constants.mainTextBlack, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
                height: 15,
              ),
              //========================== Text Field ==========================//
              Expanded(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: constants.lightGray.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Create & Cancel Button
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.hrPrimary,
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
    },
  );
}
