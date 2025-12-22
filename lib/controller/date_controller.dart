String convertDateTimeToIso(
    DateTime date, {
      int utcHour = 18,
      int utcMinute = 0,
    }) {
  final DateTime utcDate = DateTime.utc(
    date.year,
    date.month,
    date.day,
    utcHour,
    utcMinute,
  );

  return utcDate.toIso8601String();
}
