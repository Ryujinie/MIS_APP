import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class CustomDropdownField extends StatefulWidget {
  final String initialValue;
  final double? width;
  final double? height;
  final List<DropdownMenuItem<String>> dropdownItems;

  const CustomDropdownField({
    super.key,
    required this.initialValue,
    required this.dropdownItems,
    this.width = 250,
    this.height,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  late String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: constants.lightGray.withOpacity(0.2),
        ),
      ),
      padding: const EdgeInsets.only(left: 12, bottom: 2),
      child: DropdownButtonFormField<String>(
        value: null,
        hint: Text(
          widget.initialValue,
          overflow: TextOverflow.visible,
        ),
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4),
        ),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
        items: widget.dropdownItems,
        isExpanded: true,
      ),
    );
  }
}

// class CustomDropdownFieldButton extends StatefulWidget {
//   // final String initialValue;
//   //final String? hintText;
//   final Widget? hintText;
//   final double? width;
//   final double? height;
//   final List<DropdownMenuItem<String>> dropdownItems;
//   final TextOverflow? overflow;
//   final EdgeInsets? contentPadding;
//   final Color? fillColor;
//   final InputBorder? inputBorder;

//   const CustomDropdownFieldButton({
//     super.key,
//     this.hintText,
//     required this.dropdownItems,
//     //this.width = 250,
//     this.width,
//     this.height,
//     this.overflow,
//     this.contentPadding,
//     this.fillColor,
//     this.inputBorder,
//   });

//   @override
//   State<CustomDropdownFieldButton> createState() => _CustomDropdownFieldButtonState();
// }

// class _CustomDropdownFieldButtonState extends State<CustomDropdownFieldButton> {
//   late String selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8),
//         ),
//         border: Border.all(
//           color: constants.lightGray.withOpacity(0.2),
//         ),
//       ),
//       padding: const EdgeInsets.only(left: 12, bottom: 2),
//       child: DropdownButtonFormField<String>(
//         value: null,
//         hint: widget.hintText ?? const Text(""),
//         onChanged: (newValue) {
//           setState(() {
//             selectedValue = newValue!;
//           });
//         },
//         decoration: InputDecoration(
//           border: widget.inputBorder ?? InputBorder.none,
//           isDense: true,
//           contentPadding: widget.contentPadding ?? const EdgeInsets.all(0),
//           fillColor: widget.fillColor ?? Colors.transparent,
//         ),
//         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//               color: constants.mainTextGrey,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               height: 1,
//             ),
//         items: widget.dropdownItems,
//         isExpanded: true,
//       ),
//     );
//   }
// }
