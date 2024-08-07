import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
//import 'package:ssi_mis_flutter/global/modals/admin_viewsched_modal.dart';

class ViewButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: constants.lightGray,
      icon: const Icon(Icons.visibility),
      //iconSize: 18,
    );
  }
}
