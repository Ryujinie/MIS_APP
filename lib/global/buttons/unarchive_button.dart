import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class UnarchiveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UnarchiveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: constants.lightGray,
      icon: const Icon(Icons.unarchive),
      //iconSize: 18,
    );
  }
}
