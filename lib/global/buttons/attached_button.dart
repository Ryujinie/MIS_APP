// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class AttachedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AttachedButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: const Icon(
          Icons.description_rounded,
          color: constants.lightGray,
          size: 22,
        ),
      ),
      //),
    );
  }
}
