import 'package:daily_azkar/core/routes/route_keys.dart';
import 'package:daily_azkar/features/azkar/bloc/azkar_bloc.dart';
import 'package:daily_azkar/features/azkar/ui/azkar_categories_screen.dart';
import 'package:daily_azkar/features/azkar/ui/azkar_chapters_screen.dart';
import 'package:daily_azkar/features/azkar/ui/azkar_item_screen.dart';
import 'package:daily_azkar/features/home/ui/home_screen.dart';
import 'package:daily_azkar/features/prayer_times/bloc/prayer_times_bloc.dart';
import 'package:daily_azkar/features/prayer_times/ui/prayer_times_screen.dart';
import 'package:daily_azkar/features/rosary/cubit/rosary_cubit.dart';
import 'package:daily_azkar/features/rosary/ui/rosary_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouteApp {
  RouteApp._();
  static final routes = GoRouter(
    initialLocation: RouteKeys.homeScreen,

    routes: [
      GoRoute(
        path: RouteKeys.homeScreen,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: RouteKeys.prayerTimesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => PrayerTimesBloc()
              ..add(
                LoadPrayerTimesEvent(
                  late: 24.7136,
                  long: 46.6753,
                  city: "Riyadh",
                ),
              ),
            child: PrayerTimesScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.azkarCategoriesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AzkarBloc(),
            child: AzkarCategoriesScreen(),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.azkarChaptersScreen,
        builder: (context, state) {
          final idCategory = state.extra as int;

          return BlocProvider(
            create: (context) => AzkarBloc(),
            child: AzkarChaptersScreen(idCategory: idCategory),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.azkarItemScreen,
        builder: (context, state) {
          final idChapter = state.extra as int;
          return BlocProvider(
            create: (context) => AzkarBloc(),
            child: AzkarItemScreen(chapterId: idChapter),
          );
        },
      ),
      GoRoute(
        path: RouteKeys.rosaryScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => RosaryCubit(),
            child: RosaryScreen(),
          );
        },
      ),
    ],
  );
}
