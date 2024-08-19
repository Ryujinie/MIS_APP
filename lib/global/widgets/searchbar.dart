import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/controllers/department_controllers/admin_dept_controller.dart';

class Searchbar extends StatefulWidget {
  final String hintText;
  final DepartmentController? controller;

  const Searchbar({super.key, required this.hintText, this.controller});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  late TextEditingController _textController;
  bool textChanged = false;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 2, 4, 4),
          height: 40,
          width: 300,
          decoration: const BoxDecoration(
            color: constants.adminFilter,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              //Textformfield
              Expanded(
                child: TextFormField(
                  controller: _textController,
                  onChanged: (value) {
                    _textController.text = value;
                    setState(() {
                      textChanged = true;
                    });
                  },
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: constants.mainTextBlack,
                        fontSize: 16,
                      ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: constants.lightGray,
                          fontWeight: FontWeight.w300,
                        ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),

              //Clear search
              textChanged == true
                  ? InkWell(
                      onTap: () {
                        widget.controller!
                            .fetchDataByArchived(widget.controller!.archiveVal);
                        widget.controller!.onSearched = false;
                        _textController.clear();
                        setState(() {
                          textChanged = false;
                        });
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Icon(
                            Icons.close_rounded,
                            color: constants.lightGray.withOpacity(0.8),
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: constants.adminFilter,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                widget.controller!.searchDeptByArchived(_textController.text);
                widget.controller!.onSearched = true;
              },
              hoverColor: constants.adminBtn.withOpacity(0.15),
              splashColor: constants.adminBtn.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ), // Same as container to keep the shape
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.search,
                    color: constants.adminBtn,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomSearchBar extends StatefulWidget {
  final String hintText;

  const CustomSearchBar({super.key, required this.hintText});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late String newVal;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
      height: 32,
      width: 300,
      decoration: BoxDecoration(
        color: constants.adminFilter,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        // onChanged: (value) {  //saves every typed letter
        //   newVal = value;
        //   print(value);
        // },

        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: constants.mainTextBlack),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: constants.lightGray,
                fontWeight: FontWeight.w300,
              ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.search,
              color: constants.lightGray,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchBarFilter extends StatefulWidget {
  final String hintText;

  const CustomSearchBarFilter({super.key, required this.hintText});

  @override
  State<CustomSearchBarFilter> createState() => _CustomSearchBarFilterState();
}

class _CustomSearchBarFilterState extends State<CustomSearchBarFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
      height: 32,
      width: 300,
      decoration: BoxDecoration(
        color: constants.adminFilter,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: constants.mainTextGrey, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: constants.lightGray,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: constants.mainTextBlack),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: constants.lightGray,
                      fontWeight: FontWeight.w300,
                    ),
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _selectDate(context);
            },
            icon: const Icon(Icons.filter_alt_rounded),
            iconSize: 24,
            color: constants.lightGray,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  // ========================== Date Picker ==========================
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

class CustomSearchBar2 extends StatefulWidget {
  final String hintText;

  const CustomSearchBar2({super.key, required this.hintText});

  @override
  State<CustomSearchBar2> createState() => _CustomSearchBar2State();
}

class _CustomSearchBar2State extends State<CustomSearchBar2> {
  final List<DateTime?> _dates = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
      height: 35,
      width: 405,
      decoration: BoxDecoration(
        color: constants.adminFilter,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: constants.darkGray),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: constants.mainTextBlack),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: constants.lightGray,
                      fontWeight: FontWeight.w300,
                    ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.search,
                    color: constants.lightGray,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () async {
              //
              await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                  calendarType: CalendarDatePicker2Type.range,
                ),
                useSafeArea: true,
                dialogSize: const Size(325, 400),
                value: _dates,
                borderRadius: BorderRadius.circular(15),
                builder: (context, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: child,
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_alt_rounded),
            iconSize: 24,
            color: constants.lightGray,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
