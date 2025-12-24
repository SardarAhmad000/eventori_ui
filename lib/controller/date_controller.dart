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

String formatIsoToDDMMYY(String isoDate) {
  final DateTime dateTime = DateTime.parse(isoDate);

  final String day = dateTime.day.toString().padLeft(2, '0');
  final String month = dateTime.month.toString().padLeft(2, '0');
  final String year = (dateTime.year % 100).toString().padLeft(2, '0');

  return '$day-$month-$year';
}

