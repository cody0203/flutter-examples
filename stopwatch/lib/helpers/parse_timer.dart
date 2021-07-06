class ParseTimer {
  static String padToTwo(double number) {
    final int parseNum = number.toInt();
    return (parseNum <= 9 ? '0${parseNum}' : parseNum.toString());
  }

  static String parseTimer(double centiseconds) {
    double minutes = 0;
    double seconds = 0;

    if (centiseconds < 0) {
      centiseconds = 0;
    }

    if (centiseconds < 100) {
      return '00:00,${padToTwo(centiseconds)}';
    }

    double remainCentiseconds = centiseconds % 100;
    seconds = (centiseconds - remainCentiseconds) / 100;

    if (seconds < 60) {
      return '00:${padToTwo(seconds)},${padToTwo(remainCentiseconds)}';
    }

    var remainSeconds = seconds % 60;
    minutes = (seconds - remainSeconds) / 60;

    return '${padToTwo(minutes)}:${padToTwo(remainSeconds)}:${padToTwo(remainCentiseconds)}';
  }
}
