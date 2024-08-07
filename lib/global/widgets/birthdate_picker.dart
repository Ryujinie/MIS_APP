import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({
    super.key,
    this.height = 35,
    this.width = double.infinity,
    this.onTap,
  });

  final double? height;
  final double? width;
  final GestureTapCallback? onTap;

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  DateTime? selectedDate;
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

  // ========================== DateTime Picker ==========================
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: focusNotifier,
        builder: (_, isFocus, child) {
          return SizedBox(
            height: widget.height,
            width: widget.width,
            child: ElevatedButton(
              focusNode: fnode,

              onPressed: () async {
                await _selectDate(context);
                fnode.requestFocus();
                _onFocusChange();
              },

              // button style
              style: ElevatedButton.styleFrom(
                backgroundColor: isFocus
                    ? constants.hrFormFields
                    : constants.lightGray.withOpacity(0.2),
                foregroundColor: constants.hrFormFields,
                shadowColor: Colors.transparent,
                minimumSize: Size.zero,
                padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                elevation: 0,
                shape: isFocus
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: constants.hrPrimary,
                        ),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedDate == null

                      // hint text
                      ? Text('yyyy-mm-dd',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: constants.lightGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))

                      // selected date
                      : Text(
                          DateFormat('MM/dd/yyyy')
                              .format(selectedDate!)
                              .toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: constants.mainTextBlack,
                                    fontSize: 14,
                                  )),
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: constants.darkGray,
                    size: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
