// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.color,
    this.icon,
    this.label,
    required this.borderRadius,
  });

  final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final Widget? label;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: icon ?? label!,
    );
  }
}

class CustomAlertDialogButton extends StatelessWidget {
  const CustomAlertDialogButton({
    super.key,
    required this.onPressed,
    required this.color,
    this.icon,
    this.label,
    //required this.borderRadius,
  });

  final VoidCallback onPressed;
  final Color color;
  final Icon? icon;
  final Widget? label;
  //final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // Show the dialog and await confirmation
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Archive',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: constants.mainTextBlack,
                      fontSize: 22,
                    )),
            content: Text('Are you sure you want to archive?',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: constants.mainTextBlack,
                      fontSize: 16,
                    )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: constants.adminBtn,
                    label: Text("Cancel",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextWhite,
                              fontSize: 16,
                            )),
                    borderRadius: 20,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: constants.adminBtnGreen,
                    label: Text("   Yes   ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: constants.mainTextWhite,
                              fontSize: 16,
                            )),
                    borderRadius: 20,
                  ),
                ],
              ),
            ],
          ),
        );
        // Handle confirmed or cancelled state
        if (confirmed != null) {
          onPressed(); // Call the provided onPressed callback with confirmation result
        } else {
          const Text(
              'Dialog dismissed without confirmation.'); // Optional: Handle dismissal
        }
      },
      icon: const Icon(Icons.archive),
      color: constants.lightGray,
    );
  }
}
