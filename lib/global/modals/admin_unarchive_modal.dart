import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/unarchive_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class Unarchive extends StatelessWidget {
  const Unarchive({super.key, this.user});

  final String? user;

  @override
  Widget build(BuildContext context) {
    return UnarchiveButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                width: double.infinity,
                child: AlertDialog(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: constants.mainTextBlack),
                  title: const Text(
                    "Restore",
                    textAlign: TextAlign.center,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(40, 24, 40, 48),
                  content: const Text(
                      "Are you sure you want to restore this record?"),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: constants.lightGray,
                          label: Text(
                            "Cancel",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: constants.mainTextWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          borderRadius: 20,
                        ),
                        const SizedBox(width: 24),
                        CustomElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: user == 'admin'
                              ? constants.adminBtn
                              : user == 'employee'
                                  ? constants.empBtn
                                  : user == 'hr'
                                      ? constants.hrBtn
                                      : user == 'supervisor'
                                          ? constants.supervisorBtn
                                          : user == 'manager'
                                              ? constants.mngrBtn
                                              : constants.adminBtnGreen,
                          label: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Yes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
            }));
  }
}
