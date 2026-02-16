class DateTimeUtils {
  DateTimeUtils._();

  static String formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$m/$d/$y';
  }

  static String formatTime(int hour, int minute) {
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final m = minute.toString().padLeft(2, '0');
    return '$hour12:$m $period';
  }

  static DateTime? tryParseDate(String value) {
    if (value.trim().isEmpty) return null;
    final parts = value.split('/');
    if (parts.length != 3) return null;
    final m = int.tryParse(parts[0]);
    final d = int.tryParse(parts[1]);
    final y = int.tryParse(parts[2]);
    if (m == null || d == null || y == null) return null;
    if (m < 1 || m > 12 || d < 1 || d > 31 || y < 1900 || y > 2100) {
      return null;
    }
    try {
      return DateTime(y, m, d);
    } catch (_) {
      return null;
    }
  }

  static (int hour, int minute)? tryParseTime(String value) {
    if (value.trim().isEmpty) return null;
    final upper = value.toUpperCase();
    final isPm = upper.contains('PM');
    final isAm = upper.contains('AM');
    if (!isAm && !isPm) return null;
    final withoutPeriod = value.replaceAll(RegExp(r'\s*(AM|PM)\s*', caseSensitive: false), '').trim();
    final parts = withoutPeriod.split(':');
    if (parts.isEmpty) return null;
    var hour = int.tryParse(parts[0]);
    final minute = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
    if (hour == null || hour < 0 || hour > 12 || minute < 0 || minute > 59) return null;
    if (hour == 12) hour = 0;
    if (isPm) hour += 12;
    return (hour, minute);
  }
}
