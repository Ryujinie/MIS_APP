// Archived Schedule

class Schedule {
  final int shiftID;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> restDay;

  Schedule({
    required this.shiftID,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.restDay,
  });
}

// ========================== Sample Table Data ==========================

final List<Schedule> scheduleArchived = [
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2023, 04, 01),
    endDate: DateTime(2023, 04, 30),
    startTime: DateTime(2023, 04, 01, 9, 00),
    endTime: DateTime(2023, 04, 30, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2023, 05, 01),
    endDate: DateTime(2023, 05, 31),
    startTime: DateTime(2023, 05, 01, 6, 00),
    endTime: DateTime(2023, 05, 31, 15, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2023, 06, 01),
    endDate: DateTime(2023, 06, 30),
    startTime: DateTime(2023, 06, 01, 8, 00),
    endTime: DateTime(2023, 06, 31, 17, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 409012,
    startDate: DateTime(2023, 07, 01),
    endDate: DateTime(2023, 07, 20),
    startTime: DateTime(2023, 07, 01, 7, 00),
    endTime: DateTime(2023, 07, 20, 16, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
];
