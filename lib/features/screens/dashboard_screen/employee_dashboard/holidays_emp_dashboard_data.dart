// ========================== Sample Upcoming Holidays Data ==========================
class UpcomingHolidays {
  final String holidayName;
  final String holidayType;
  final String holidayDay;
  final String holidayDate;

  UpcomingHolidays({
    required this.holidayName,
    required this.holidayType,
    required this.holidayDay,
    required this.holidayDate,
  });
}

final List<UpcomingHolidays> upcomingHolidays = [
  UpcomingHolidays(
    holidayName: "Eid'l Fitr",
    holidayType: 'Special holiday',
    holidayDay: 'Wednesday',
    holidayDate: '06/05/24',
  ),
  UpcomingHolidays(
    holidayName: 'Independence Day',
    holidayType: 'Regular holiday',
    holidayDay: 'Wednesday',
    holidayDate: '06/12/24',
  ),
  UpcomingHolidays(
    holidayName: 'Ninoy Aquino Day',
    holidayType: 'Special non-working holiday',
    holidayDay: 'Wednesday',
    holidayDate: '07/21/24',
  ),
  UpcomingHolidays(
    holidayName: "All Saint's Day",
    holidayType: 'Special non-working holiday',
    holidayDay: 'Friday',
    holidayDate: '11/01/24',
  ),
  UpcomingHolidays(
    holidayName: "All Souls' Day",
    holidayType: 'Special non-working holiday',
    holidayDay: 'Saturday',
    holidayDate: '11/02/24',
  ),
];
