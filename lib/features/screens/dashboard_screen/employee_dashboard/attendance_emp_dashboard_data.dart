// ========================== Sample Attendance History Data ==========================
class AttendanceHistory {
  final String dateHistory;
  final String timeInHistory;
  final String timeOutHistory;
  final String effectiveTime;
  final String effectiveTime2;

  AttendanceHistory({
    required this.dateHistory,
    required this.timeInHistory,
    required this.timeOutHistory,
    required this.effectiveTime,
    required this.effectiveTime2,
  });
}

final List<AttendanceHistory> attendanceHistory = [
  AttendanceHistory(
    dateHistory: 'Today',
    timeInHistory: '8:56 AM',
    timeOutHistory: 'Still timed in',
    effectiveTime: '3.27 hours',
    effectiveTime2: '/8 hours',
  ),
  AttendanceHistory(
    dateHistory: '05/21/24',
    timeInHistory: '8:55 AM',
    timeOutHistory: '5:00 PM',
    effectiveTime: '8.00 hours',
    effectiveTime2: '/8 hours',
  ),
  AttendanceHistory(
    dateHistory: '05/20/24',
    timeInHistory: '8:58 AM',
    timeOutHistory: '5:00 PM',
    effectiveTime: '8.00 hours',
    effectiveTime2: '/8 hours',
  ),
  AttendanceHistory(
    dateHistory: '05/20/24',
    timeInHistory: '8:53 AM',
    timeOutHistory: '5:00 PM',
    effectiveTime: '8.00 hours',
    effectiveTime2: '/8 hours',
  ),
];
