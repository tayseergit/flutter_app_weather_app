import 'package:weather_app/data/local/QueryMap.dart';

class SunPath {
  static double SunRisePath() {
    final currentTime = DateTime.now().millisecondsSinceEpoch / 1000;
    final sunriseTimestamp = QueryMap.query!['sys']['sunrise'];
    final sunsetTimestamp = QueryMap.query!['sys']['sunset'];
    double currentSunPosition = 0;

    if (currentTime < sunriseTimestamp || currentTime > sunsetTimestamp) {
      print('The sun is currently below the horizon');
    } else {
      final daylightDuration = sunsetTimestamp - sunriseTimestamp;
      currentSunPosition =
          (currentTime - sunriseTimestamp) / daylightDuration * 100;
      print(
          'The sun is at ${currentSunPosition.toStringAsFixed(2)}% of its path between sunrise and sunset');
    }

    return currentSunPosition;
  }
}
