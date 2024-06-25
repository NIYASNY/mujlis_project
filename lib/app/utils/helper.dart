
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:ui_for_college/app/utils/constants.dart';

//date and time page
int getDateTimestamp(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day)
      .millisecondsSinceEpoch;
}

String getFormattedDate(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat('MMM d yyyy').format(date);
}

Color getLabelColor(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);

  return labelColors[date.weekday % labelColors.length];
}