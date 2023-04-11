import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/foundation.dart';
import '../res/strings.dart';

class DateHelper {
  String date;
  final String hour;
  final _todayDate = DateTimeFormat.format(DateTime.now(), format: 'j-m-Y');
  final _day = int.parse(DateTimeFormat.format(DateTime.now(), format: 'j'));
  int? dayBefore;

  DateHelper({required this.date, required this.hour});

  int calculateTheDayBefore() {
    dayBefore = _day - 1;
    return dayBefore!;
  }

  String getDate() {
    String value = "";
    try {
      if (_day <= 31 && _day >= 1) {
        if (date ==
            DateTimeFormat.format(DateTime.now(),
                    format: '${calculateTheDayBefore()}-m-Y')
                .toString()) {
          value = '${Strings.kYesterday} $hour';
        } else if (date == _todayDate) {
          value = '${Strings.kToday} $hour';
        } else {
          value = '$date  $hour';
        }
        date = value;
      }
    } catch (exception) {
      if (kDebugMode) {}
    }
    return value;
  }
}
