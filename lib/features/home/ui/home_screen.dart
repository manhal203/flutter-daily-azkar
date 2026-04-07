import 'package:daily_azkar/core/routes/route_keys.dart';
import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/home/widgets/home_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Daily Azkar"),
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

      body: Container(
        width: double.infinity,
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

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                HomeButtons(
                  title: "Prayer Times",
                  onTap: () {
                    context.push(RouteKeys.prayerTimesScreen);
                  },
                ),

                SizedBox(height: 20),

                HomeButtons(
                  title: "Azkar",
                  onTap: () {
                    context.push(RouteKeys.azkarCategoriesScreen);
                  },
                ),

                SizedBox(height: 20),

                HomeButtons(
                  title: "Rosary",
                  onTap: () {
                    context.push(RouteKeys.rosaryScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
