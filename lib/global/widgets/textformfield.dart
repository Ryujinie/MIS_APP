import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// Emp Profile TextFormFields
class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final double? width;

  const CustomTextFormField(
      {super.key, required this.initialValue, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: constants.lightGray.withOpacity(0.2),
          // /width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextFormField(
        initialValue: initialValue,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
        ),
        autofocus: true,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
      ),
    );
  }
}

// With Focused Border
//Add Employee TextFormFields
class CustomTextFormField2 extends StatefulWidget {
  const CustomTextFormField2({
    super.key,
    this.hintText,
    this.height = 35,
    this.width = 150,
    this.isViewed = false,
    this.isOutlineViewed = false,
    this.onTap,
    this.onChanged,
  });

  final String? hintText;
  final double height;
  final double width;
  final bool isViewed;
  final bool isOutlineViewed;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
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
  void dispose() {
    fnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: focusNotifier,
        builder: (_, isFocus, child) {
          return SizedBox(
            height: widget.height,
            width: widget.width,
            child: TextFormField(
              focusNode: fnode,
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

                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              onChanged: (value) {
                widget.onChanged;
              },
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: constants.mainTextBlack),
            ),
          );
        });
  }
}
