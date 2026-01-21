import 'package:intl/intl.dart';

class DateFormatter {
  /// Format date to readable format (e.g., "January 15, 2024")
  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMMM d, yyyy').format(date);
  }
  
  /// Format date to short format (e.g., "Jan 15, 2024")
  static String formatDateShort(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM d, yyyy').format(date);
  }
  
  /// Format date string from API (e.g., "2024-01-15")
  static String formatDateString(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return formatDate(date);
    } catch (e) {
      return dateString;
    }
  }
  
  /// Format date string to short format
  static String formatDateStringShort(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      return formatDateShort(date);
    } catch (e) {
      return dateString;
    }
  }
  
  /// Format runtime in minutes to readable format (e.g., "2h 15m")
  static String formatRuntime(int? minutes) {
    if (minutes == null || minutes == 0) return '';
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours > 0 && mins > 0) {
      return '${hours}h ${mins}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${mins}m';
    }
  }
}
