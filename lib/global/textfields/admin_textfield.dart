import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;

// =============== ADMIN TEXT FIELD =============== //
class AdminTextFieldContainer extends StatefulWidget {
  const AdminTextFieldContainer({
    super.key,
    required this.hintText,
    this.height = 30,
    this.width = 150,
    this.isViewed = false,
    this.isOutlineViewed = false,
    this.onTap,
  });

  final String hintText;
  final double height;
  final double width;
  final bool isViewed;
  final bool isOutlineViewed;
  final GestureTapCallback? onTap;

  @override
  State<AdminTextFieldContainer> createState() =>
      _AdminTextFieldContainerState();
}

class _AdminTextFieldContainerState extends State<AdminTextFieldContainer> {
  bool _isViewed = false;
  bool _isOutlineViewed = false;

  @override
  void initState() {
    super.initState();
    _isViewed = widget.isViewed;
    _isOutlineViewed = widget.isOutlineViewed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: _isViewed ? constants.mainTextWhite : constants.adminBG,
        borderRadius: BorderRadius.circular(20),
        border: _isOutlineViewed
            ? Border.all(color: constants.adminPrimary)
            : Border.all(color: constants.mainTextWhite),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 2),
        child: TextField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
          onTap: () {
            setState(
              () {
                _isViewed = !_isViewed;
                _isOutlineViewed = !_isOutlineViewed;
              },
            );
          },
          onTapOutside: (event) => setState(
            () {
              _isViewed = false;
              _isOutlineViewed = false;
            },
            // FocusManager.instance.primaryFocus?.unfocus(),
          ),
        ),
      ),
    );
  }
}

// =============== HR TEXT FIELD =============== //
class HRTextFieldContainer extends StatefulWidget {
  const HRTextFieldContainer({
    super.key,
    required this.hintText,
    this.height = 35,
    this.width = 150,
    this.isViewed = false,
    this.isOutlineViewed = false,
    this.onTap,
  });

  final String hintText;
  final double height;
  final double width;
  final bool isViewed;
  final bool isOutlineViewed;
  final GestureTapCallback? onTap;

  @override
  State<HRTextFieldContainer> createState() => _HRTextFieldContainerState();
}

class _HRTextFieldContainerState extends State<HRTextFieldContainer> {
  bool _isViewed = false;
  bool _isOutlineViewed = false;

  @override
  void initState() {
    super.initState();
    _isViewed = widget.isViewed;
    _isOutlineViewed = widget.isOutlineViewed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: _isViewed ? constants.mainTextWhite : constants.adminBG,
        borderRadius: BorderRadius.circular(20),
        border: _isOutlineViewed
            ? Border.all(color: constants.hrPrimary)
            : Border.all(color: constants.mainTextWhite),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 2),
        child: TextField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
          onTap: () {
            setState(
              () {
                _isViewed = !_isViewed;
                _isOutlineViewed = !_isOutlineViewed;
              },
            );
          },
          onTapOutside: (event) => setState(
            () {
              _isViewed = false;
              _isOutlineViewed = false;
            },
            // FocusManager.instance.primaryFocus?.unfocus(),
          ),
        ),
      ),
    );
  }
}
