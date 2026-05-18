import 'package:intl/intl.dart';

class DateFormatter {
  // Use for chat List time
  static String formatChatListTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    // for today
    if(difference.inDays == 0) {
      return DateFormat(
        'hh:mm a',
      ).format(time);
    }
    // for yesterday
    else if(difference.inDays == 1) {
      return "Yesterday";
    }
    // within 7 days hole
    else if(difference.inDays < 7) {
      return DateFormat(
        'EEEE',
      ).format(time);
    }
    // older date
    else {
      return DateFormat(
        'dd MMM',
      ).format(time);
    }
  }
  // For use chat bubble time
  static String formatMessageTime(DateTime time) {
    return DateFormat(
      'hh:mm a',
    ).format(time);
  }

  // full formated date
  static String fullDateTime(
      DateTime time) {

    return DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(time);
  }
}