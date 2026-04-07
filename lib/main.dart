import 'package:daily_azkar/core/routes/route_app.dart';
import 'package:daily_azkar/core/theme/app_theme.dart';
import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/azkar/bloc/azkar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//final getIt = GetIt.I;

void main() {
  configureDependencies();
  runApp(
    BlocProvider(create: (context) => ThemeBloc(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final themeMode = (state as SwitchThemeState).themeMode;
        return MaterialApp.router(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: RouteApp.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

void configureDependencies() {
  GetIt.I.registerSingleton<AzkarBloc>(AzkarBloc());
}
