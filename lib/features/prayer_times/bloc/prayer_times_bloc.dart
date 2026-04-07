import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'prayer_times_event.dart';
part 'prayer_times_state.dart';

class PrayerTimesBloc extends Bloc<PrayerTimesEvent, PrayerTimesState> {
  final MuslimRepository muslimRepository = MuslimRepository();

  PrayerTimesBloc() : super(PrayerTimesInitial()) {
    on<LoadPrayerTimesEvent>(_onLoadPrayerTimes);
  }

  Future<void> _onLoadPrayerTimes(
    LoadPrayerTimesEvent event,
    Emitter<PrayerTimesState> emit,
  ) async {
    emit(PrayerTimesLoading());

    try {
      final location = Location(
        countryCode: 'SA',
        countryName: 'Saudi Arabia',
        name: event.city,
        latitude: event.late,
        longitude: event.long,
        hasFixedPrayerTime: false,
        id: 1,
      );

      final attribute = PrayerAttribute(
        calculationMethod: CalculationMethod.makkah,
        asrMethod: AsrMethod.shafii,
        higherLatitudeMethod: HigherLatitudeMethod.angleBased,
        offset: [0, 0, 0, 0, 0, 0],
      );

      final prayerTimes = await muslimRepository.getPrayerTimes(
        location: location,
        date: DateTime.now(),
        attribute: attribute,
        useFixedPrayer: false,
      );

      if (prayerTimes != null) {
        emit(PrayerTimesLoaded(prayerTimes));
      } else {
        emit(PrayerTimesError("فشل تحميل أوقات الصلاة"));
      }
    } catch (e) {
      emit(PrayerTimesError(e.toString()));
    }
  }
}
