// ========================== Gender Picker ==========================
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get genders {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Male",
      child: Text(
        "Male",
      ),
    ),
    const DropdownMenuItem(
      value: "Female",
      child: Text("Female"),
    ),
  ];
  return menuItems;
}

// ========================== Job Position Picker ==========================
List<DropdownMenuItem<String>> get jobPositions {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Job Position 1",
      child: Text(
        "Job Position 1",
      ),
    ),
    const DropdownMenuItem(
      value: "Job Position 2",
      child: Text("Job Position 2"),
    ),
    const DropdownMenuItem(
      value: "Job Position 3",
      child: Text("Job Position 3"),
    ),
    const DropdownMenuItem(
      value: "Job Position 4",
      child: Text("Job Position 4"),
    ),
  ];
  return menuItems;
}

// ========================== Employment Type Picker ==========================
List<DropdownMenuItem<String>> get employmentTypes {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Regular",
      child: Text("Regular"),
    ),
    const DropdownMenuItem(
      value: "Contractual",
      child: Text("Contractual"),
    ),
    const DropdownMenuItem(
      value: "Probationary",
      child: Text("Probationary"),
    ),
    const DropdownMenuItem(
      value: "Intern",
      child: Text("Intern"),
    ),
    const DropdownMenuItem(
      value: "Part-Time",
      child: Text("Part-Time"),
    ),
  ];
  return menuItems;
}

// ========================== Role Picker ==========================
List<DropdownMenuItem<String>> get roles {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Employee",
      child: Text("Employee"),
    ),
    const DropdownMenuItem(
      value: "Manager",
      child: Text("Manager"),
    ),
    const DropdownMenuItem(
      value: "Supervisor",
      child: Text("Supervisor"),
    ),
    const DropdownMenuItem(
      value: "HR",
      child: Text("HR"),
    ),
    const DropdownMenuItem(
      value: "Admin",
      child: Text("Admin"),
    ),
  ];
  return menuItems;
}

// ========================== Department Picker ==========================
List<DropdownMenuItem<String>> get departments {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "IT",
      child: Text("IT"),
    ),
    const DropdownMenuItem(
      value: "Marketing",
      child: Text("Marketing"),
    ),
    const DropdownMenuItem(
      value: "HR",
      child: Text("HR"),
    ),
    const DropdownMenuItem(
      value: "Accounting",
      child: Text("Accounting"),
    ),
    const DropdownMenuItem(
      value: "Management",
      child: Text("Management"),
    ),
  ];
  return menuItems;
}

// ========================== Schedule Picker ==========================
List<DropdownMenuItem<String>> get schedules {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Schedule 1",
      child: Text("Schedule 1"),
    ),
    const DropdownMenuItem(
      value: "Schedule 2",
      child: Text("Schedule 2"),
    ),
    const DropdownMenuItem(
      value: "Schedule 3",
      child: Text("Schedule 3"),
    ),
    const DropdownMenuItem(
      value: "Schedule 4",
      child: Text("Schedule 4"),
    ),
    const DropdownMenuItem(
      value: "Schedule 5",
      child: Text("Schedule 5"),
    ),
  ];
  return menuItems;
}
