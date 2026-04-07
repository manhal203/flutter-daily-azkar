import 'package:daily_azkar/core/extensions/date_time_extention.dart';
import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/prayer_times/bloc/prayer_times_bloc.dart';
import 'package:daily_azkar/features/prayer_times/widgets/prayer_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Prayer Times"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(SwitchThemeEvent());
            },

            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
      body: BlocBuilder<PrayerTimesBloc, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLoaded) {
            final times = state.prayerTimes;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    isDark
                        ? "assets/images/dark_mode.png"
                        : "assets/images/light_mode.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(14),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: .min,
                                children: [
                                  Row(
                                    mainAxisAlignment: .center,
                                    children: [
                                      Text(
                                        "Riyadh",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: .bold,
                                        ),
                                      ),
                                      Icon(Icons.location_on, size: 20),
                                    ],
                                  ),

                                  SizedBox(height: 16),
                                  PrayerRow(
                                    name: "Fajr",
                                    time: times.fajr.displayTime(),
                                  ),
                                  Divider(),
                                  PrayerRow(
                                    name: "Sunrise",
                                    time: times.sunrise.displayTime(),
                                  ),
                                  Divider(),
                                  PrayerRow(
                                    name: "Dhuhr",
                                    time: times.dhuhr.displayTime(),
                                  ),
                                  Divider(),
                                  PrayerRow(
                                    name: "Asr",
                                    time: times.asr.displayTime(),
                                  ),
                                  Divider(),
                                  PrayerRow(
                                    name: "Maghrib",
                                    time: times.maghrib.displayTime(),
                                  ),
                                  Divider(),
                                  PrayerRow(
                                    name: "Isha",
                                    time: times.isha.displayTime(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is PrayerTimesError) {
            return Center(child: Text('Error ${state.message}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
