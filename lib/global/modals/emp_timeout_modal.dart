import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class TimeOut extends StatefulWidget {
  const TimeOut({super.key, this.user});

  final String? user;

  @override
  State<TimeOut> createState() => _TimeOutState();
}

class _TimeOutState extends State<TimeOut> {
  @override
  Widget build(BuildContext context) {
    int selectedAction = 0;

    return SizedBox(
      width: double.infinity,
      child: AlertDialog(
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: constants.mainTextBlack),
        title: const Text(
          "Time Out",
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.fromLTRB(40, 12, 40, 48),
        content: const Text("Are you sure you want to time out?"),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cancel
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
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

              // Yes
              CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedAction = 1;
                  });
                  Navigator.pop(context, selectedAction);
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
                  padding: const EdgeInsets.symmetric(horizontal: 11),
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
      ),
    );
  }
}
