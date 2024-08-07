// ========================== Sample Tasks Data ==========================
class Tasks {
  final String taskID;
  final String taskDescription;
  final String taskLabel;
  final String taskPriority;
  final String taskDueDate;

  Tasks({
    required this.taskID,
    required this.taskDescription,
    required this.taskLabel,
    required this.taskPriority,
    required this.taskDueDate,
  });
}

final List<Tasks> tasks = [
  Tasks(
    taskID: '1A',
    taskDescription: "Request for Software Update",
    taskLabel: "John Doe",
    taskPriority: "IT",
    taskDueDate: "June 12 ",
  ),
  Tasks(
    taskID: '2A',
    taskDescription: "Internet Connectivity Issue",
    taskLabel: "Jane Smith",
    taskPriority: "Network Operations",
    taskDueDate: " May 21  ",
  ),
  Tasks(
    taskID: '3C',
    taskDescription: "Hardware Malfunction",
    taskLabel: "Michael Johnson",
    taskPriority: "Hardware Support",
    taskDueDate: "May 25",
  ),
  Tasks(
    taskID: '4D',
    taskDescription: "Password Reset Request",
    taskLabel: "Emily Williams",
    taskPriority: "IT",
    taskDueDate: "June 02",
  ),
  Tasks(
    taskID: '5A',
    taskDescription: "New Employee Onboarding",
    taskLabel: "David Brown",
    taskPriority: "HR",
    taskDueDate: "June 17",
  ),
  Tasks(
    taskID: '6E',
    taskDescription: "Meeting Room Reservation",
    taskLabel: "Sarah Wilson",
    taskPriority: "Admin",
    taskDueDate: "June 06",
  ),
  Tasks(
    taskID: '7C',
    taskDescription: "Printer Jam Issue",
    taskLabel: "Robert Lee",
    taskPriority: "IT",
    taskDueDate: "May 30",
  ),
];
