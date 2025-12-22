import 'package:intl/intl.dart';

class DateUtilsHelper {
  static Map<String, String> getMonthAndDay(String isoDate) {
    final DateTime date = DateTime.parse(isoDate);

    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    return {
      'month': months[date.month - 1],
      'day': date.day.toString().padLeft(2, '0'),
    };
  }


  static String formatToDayMonthYear(String isoDate) {
    final DateTime date = DateTime.parse(isoDate);
    return DateFormat('dd MMM, yyyy').format(date);
  }

}
