import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_screen.dart';

//// ========================== PopMenu Static Text ==========================
class AppTheme {
  static const TextStyle adminMenuItemStyle = TextStyle(
      fontFamily: 'Roboto-Light',
      color: constants.mainTextWhite,
      fontSize: 22,
      fontWeight: FontWeight.w400);
}

//========================== Logout Handler ==========================
void logoutHandler(BuildContext context, String? value) {
  if (value == "logout") {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}

// ========================== ADMIN PopItems AppBar ==========================
List<PopupMenuItem<String>> get appBarDropDownItems {
  List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.logout_rounded,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Logout",
            style: AppTheme.adminMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(value: "", child: Text("")),
    const PopupMenuItem(value: "", child: Text("")),
  ];
  return menuItems;
}

// ========================== ADMIN Dropdown AppBar ==========================
void adminShowLogoutMenu(BuildContext context) {
  final popupMenuEntries = appBarDropDownItems
      .map((menuItem) => PopupMenuItem<String>(
            value: menuItem.value,
            child: menuItem.child,
          ))
      .toList();

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  );

  showMenu<String>(
    shape: shape,
    color: constants.adminPrimary,
    context: context,
    position: const RelativeRect.fromLTRB(10, 120, 0, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== Employee Dropdown AppBar ==========================
void empShowLogoutMenu(BuildContext context) {
  final popupMenuEntries = appBarDropDownItems
      .map((menuItem) => PopupMenuItem<String>(
            value: menuItem.value,
            child: menuItem.child,
          ))
      .toList();

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  );

  showMenu<String>(
    shape: shape,
    color: constants.empBtn,
    context: context,
    position: const RelativeRect.fromLTRB(10, 120, 0, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== HR Dropdown AppBar ==========================
void hrShowLogoutMenu(BuildContext context) {
  final popupMenuEntries = appBarDropDownItems
      .map((menuItem) => PopupMenuItem<String>(
            value: menuItem.value,
            child: menuItem.child,
          ))
      .toList();

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  );

  showMenu<String>(
    shape: shape,
    color: constants.hrPrimary,
    context: context,
    position: const RelativeRect.fromLTRB(10, 120, 0, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== Supervisor Dropdown AppBar ==========================
void supShowLogoutMenu(BuildContext context) {
  final popupMenuEntries = appBarDropDownItems
      .map((menuItem) => PopupMenuItem<String>(
            value: menuItem.value,
            child: menuItem.child,
          ))
      .toList();

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  );

  showMenu<String>(
    shape: shape,
    color: constants.supervisorPrimary,
    context: context,
    position: const RelativeRect.fromLTRB(10, 120, 0, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

//// ========================== Manager PopMenu Static Text ==========================
class ManagerTheme {
  static const TextStyle managerMenuItemStyle = TextStyle(
      fontFamily: 'Roboto-Light',
      color: constants.mainTextBlack,
      fontSize: 22,
      fontWeight: FontWeight.w400);
}

// ========================== MANAGER PopItems AppBar ==========================
List<PopupMenuItem<String>> get managerBarDropDownItems {
  List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.logout_rounded,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Logout",
            style: ManagerTheme.managerMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(value: "", child: Text("")),
    const PopupMenuItem(value: "", child: Text("")),
  ];
  return menuItems;
}

// ========================== Manager Dropdown AppBar ==========================
void managerShowLogoutMenu(BuildContext context) {
  final popupMenuEntries = managerBarDropDownItems
      .map((menuItem) => PopupMenuItem<String>(
            value: menuItem.value,
            child: menuItem.child,
          ))
      .toList();

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  );

  showMenu<String>(
    shape: shape,
    color: constants.mngrPrimary,
    context: context,
    position: const RelativeRect.fromLTRB(10, 120, 0, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}
