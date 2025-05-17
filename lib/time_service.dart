import 'package:shared_preferences/shared_preferences.dart';

class TimeService {
  static const _saveTime = 'total_time';

  /// Save a time string like '01:20:05'
  static Future<void> saveTimeInt(int time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_saveTime, time);
  }

  /// Load the saved time string, or null if not set
  static Future<int?> getSavedTimeInt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_saveTime);
  }

  /// Clear saved time
  static Future<void> clearSavedTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_saveTime);
  }

  /// Utility: Convert 'hh:mm:ss' to total seconds
  static int parseToSeconds(String time) {
    final parts = time.split(':').map(int.parse).toList();

    if (parts.length == 3) {
      return parts[0] * 3600 + parts[1] * 60 + parts[2];
    } else if (parts.length == 2) {
      return parts[0] * 60 + parts[1];
    } else if (parts.length == 1) {
      return parts[0];
    } else {
      throw FormatException("Invalid time format: $time");
    }
  }

  /// Utility: Convert seconds to 'hh:mm:ss'
  static String formatSeconds(int totalSeconds) {
    final hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
