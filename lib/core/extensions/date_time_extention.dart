extension TimeFormatExtension on DateTime {
  String displayTime() {
    int hour = this.hour;
    int minute = this.minute;
    String period = hour >= 12 ? " PM" : " AM";
    hour = hour % 12;
    if (hour == 0) hour = 12;
    String minuteStr = minute.toString().padLeft(2, '0');
    return "$hour:$minuteStr $period";
  }
}
