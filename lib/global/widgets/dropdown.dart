import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.height = 35,
    this.width = double.infinity,
    this.hintText,
    required this.items,
    this.onTap,
    this.onChanged,
  });

  final double? height;
  final double? width;
  final String? hintText;
  final List<DropdownMenuItem<String>>? items;

  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  late FocusNode fnode;
  final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    fnode = FocusNode();
    fnode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    focusNotifier.value = fnode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: focusNotifier,
      builder: (_, isFocus, child) {
        return SizedBox(
          height: widget.height,
          width: widget.width,
          child: DropdownButtonFormField<String>(
            focusNode: fnode,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: constants.mainTextGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
            borderRadius: BorderRadius.circular(20),
            isDense: true,
            focusColor: Colors.transparent,
            autofocus: false,
            hint: Text(
              widget.hintText!,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: constants.lightGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            decoration: InputDecoration(
              // underline
              border: InputBorder.none,

              // border when clicked
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: constants.hrPrimary,
                ),
              ),

              // textformfield shape
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),

              // color
              filled: true,
              fillColor: isFocus
                  ? constants.adminFormFields
                  : constants.lightGray.withOpacity(0.2),

              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

              isDense: true,
            ),
            value: selectedValue,
            items: widget.items,
            onChanged: (String? newValue) async {
              selectedValue = newValue!;
              widget.onChanged;
            },
          ),
        );
      },
    );
  }
}
