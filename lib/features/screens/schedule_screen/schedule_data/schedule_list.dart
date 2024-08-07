// Schedule List

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

final List<Schedule> scheduleList = [
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 04, 01),
    endDate: DateTime(2024, 04, 30),
    startTime: DateTime(2024, 04, 01, 9, 00),
    endTime: DateTime(2024, 04, 30, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 05, 01),
    endDate: DateTime(2024, 05, 31),
    startTime: DateTime(2024, 05, 01, 6, 00),
    endTime: DateTime(2024, 05, 31, 15, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 06, 01),
    endDate: DateTime(2024, 06, 30),
    startTime: DateTime(2024, 06, 01, 8, 00),
    endTime: DateTime(2024, 06, 31, 17, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 409012,
    startDate: DateTime(2024, 07, 01),
    endDate: DateTime(2024, 07, 20),
    startTime: DateTime(2024, 07, 01, 7, 00),
    endTime: DateTime(2024, 07, 20, 16, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 07, 21),
    endDate: DateTime(2024, 07, 30),
    startTime: DateTime(2024, 07, 21, 8, 00),
    endTime: DateTime(2024, 07, 30, 17, 00),
    restDay: ["Sunday", "Monday"],
  ),
  Schedule(
    shiftID: 409012,
    startDate: DateTime(2024, 08, 01),
    endDate: DateTime(2024, 08, 17),
    startTime: DateTime(2024, 08, 01, 9, 00),
    endTime: DateTime(2024, 08, 20, 18, 00),
    restDay: ["Sunday", "Monday"],
  ),
  Schedule(
    shiftID: 509012,
    startDate: DateTime(2024, 08, 17),
    endDate: DateTime(2024, 08, 31),
    startTime: DateTime(2024, 08, 21, 9, 00),
    endTime: DateTime(2024, 08, 31, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 09, 01),
    endDate: DateTime(2024, 09, 30),
    startTime: DateTime(2024, 09, 01, 9, 00),
    endTime: DateTime(2024, 09, 30, 18, 00),
    restDay: ["Saturday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 10, 01),
    endDate: DateTime(2024, 10, 31),
    startTime: DateTime(2024, 10, 01, 6, 00),
    endTime: DateTime(2024, 10, 31, 15, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 123456,
    startDate: DateTime(2024, 11, 01),
    endDate: DateTime(2024, 11, 30),
    startTime: DateTime(2024, 11, 01, 9, 00),
    endTime: DateTime(2024, 11, 30, 18, 00),
    restDay: ["Wednesday", "Sunday"],
  ),
  Schedule(
    shiftID: 789012,
    startDate: DateTime(2024, 12, 01),
    endDate: DateTime(2024, 12, 31),
    startTime: DateTime(2024, 12, 01, 6, 00),
    endTime: DateTime(2024, 12, 31, 15, 00),
    restDay: ["Sunday", "Monday"],
  ),
];
