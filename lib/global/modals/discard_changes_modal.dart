import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class DiscardChanges extends StatefulWidget {
  const DiscardChanges({super.key, required this.message, this.user});

  final String message;
  final String? user;

  @override
  State<DiscardChanges> createState() => _DiscardChangesState();
}

class _DiscardChangesState extends State<DiscardChanges> {
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
        contentPadding: const EdgeInsets.fromLTRB(40, 28, 40, 48),
        content: Text(
          widget.message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: constants.mainTextBlack,
              ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cancel
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminCloseBtn,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                  ),
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

class HRDiscardChanges extends StatefulWidget {
  const HRDiscardChanges({super.key, required this.message});

  final String message;

  @override
  State<HRDiscardChanges> createState() => _HRDiscardChangesState();
}

class _HRDiscardChangesState extends State<HRDiscardChanges> {
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
        contentPadding: const EdgeInsets.fromLTRB(40, 28, 40, 48),
        content: Text(
          widget.message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: constants.mainTextBlack,
              ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cancel
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminCloseBtn,
                label: Text(
                  "No",
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
                color: constants.hrPrimary,
                label: Text(
                  "Yes",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: constants.mainTextWhite,
                        fontWeight: FontWeight.w400,
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
