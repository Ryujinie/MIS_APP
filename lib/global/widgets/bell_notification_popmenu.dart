import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_screen.dart';

//========================== Temp Notification Handler ==========================
void logoutHandler(BuildContext context, String? value) {
  if (value == "logout") {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}

//// ========================== PopMenu Static Text ==========================
class AppTheme {
  static const TextStyle adminMenuItemStyle = TextStyle(
      fontFamily: 'Roboto-Light',
      color: constants.mainTextWhite,
      fontSize: 22,
      fontWeight: FontWeight.w400);
}

// ========================== ADMIN Dropdown AppBar ==========================
void adminNotifMenu(BuildContext context) {
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
    position: const RelativeRect.fromLTRB(900, 120, 275, 0),
    items: popupMenuEntries,
    //constraints: BoxConstraints(maxWidth: 100),
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== Employee Dropdown AppBar ==========================
void empNotifMenu(BuildContext context) {
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
    position: const RelativeRect.fromLTRB(900, 120, 275, 0),
    items: popupMenuEntries,
    //constraints: BoxConstraints(maxWidth: 100),
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== HR Dropdown AppBar ==========================
void hrNotifMenu(BuildContext context) {
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
    position: const RelativeRect.fromLTRB(900, 120, 285, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== Supervisor Dropdown AppBar ==========================
void supNotifMenu(BuildContext context) {
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
    position: const RelativeRect.fromLTRB(900, 120, 350, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}

// ========================== ADMIN Notif PopItems AppBar ==========================
List<PopupMenuItem<String>> get appBarDropDownItems {
  List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 1",
            style: AppTheme.adminMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 2",
            style: AppTheme.adminMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 3",
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

//// ========================== Manager PopMenu Static Text ==========================
class ManagerAppTheme {
  static const TextStyle managerMenuItemStyle = TextStyle(
      fontFamily: 'Roboto-Light',
      color: constants.mainTextBlack,
      fontSize: 22,
      fontWeight: FontWeight.w400);
}

// ========================== Manager Notif PopItems AppBar ==========================
List<PopupMenuItem<String>> get managerDropDownItems {
  List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 1",
            style: ManagerAppTheme.managerMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 2",
            style: ManagerAppTheme.managerMenuItemStyle,
          ),
        ],
      ),
    ),
    const PopupMenuItem(
      value: "logout",
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 15),
          Text(
            "Notification 3",
            style: ManagerAppTheme.managerMenuItemStyle,
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
void managerNotifMenu(BuildContext context) {
  final popupMenuEntries = managerDropDownItems
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
    position: const RelativeRect.fromLTRB(900, 120, 275, 0),
    items: popupMenuEntries,
  ).then((value) {
    if (value != null) {
      logoutHandler(context, value);
    }
  });
}
