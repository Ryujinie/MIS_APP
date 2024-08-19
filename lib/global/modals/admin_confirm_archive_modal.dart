import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class ConfirmArchive extends StatefulWidget {
  const ConfirmArchive({super.key, this.user});

  final String? user;

  @override
  State<ConfirmArchive> createState() => _ConfirmArchiveState();
}

class _ConfirmArchiveState extends State<ConfirmArchive> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: constants.mainTextBlack),
      title: const Text(
        "Confirm Archive",
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.fromLTRB(40, 24, 40, 48),
      content: const Text("Are you sure you want to archive this record?"),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context, 0);
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
              onPressed: () {
                Navigator.pop(context, 1);
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
