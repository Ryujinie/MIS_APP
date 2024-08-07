// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class AttachmentButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AttachmentButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(right: 8),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: const Icon(
          Icons.attach_file_rounded,
          color: constants.darkGray,
          size: 22,
        ),
      ),
      //),
    );
  }
}
