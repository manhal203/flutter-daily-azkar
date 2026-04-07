part of 'prayer_times_bloc.dart';

@immutable
sealed class PrayerTimesEvent {}

class LoadPrayerTimesEvent extends PrayerTimesEvent {
  final double late;
  final double long;
  final String city;
  LoadPrayerTimesEvent({
    required this.late,
    required this.long,
    required this.city,
  });
}
