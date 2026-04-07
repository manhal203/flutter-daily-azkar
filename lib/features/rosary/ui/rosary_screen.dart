import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/rosary/cubit/rosary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RosaryScreen extends StatelessWidget {
  const RosaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(SwitchThemeEvent());
            },
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
        title: Text("Rosary"),
        centerTitle: true,
      ),
      body: Container(
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
          child: BlocBuilder<RosaryCubit, int>(
            builder: (context, count) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: .max,
                    children: [
                      Text(
                        "Tasbeeh Counter",
                        style: TextStyle(fontSize: 22, fontWeight: .bold),
                      ),

                      SizedBox(height: 20),

                      Text(
                        "$count",
                        style: TextStyle(fontSize: 50, fontWeight: .bold),
                      ),

                      SizedBox(height: 40),

                      ElevatedButton(
                        onPressed: () {
                          context.read<RosaryCubit>().increment();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Tap",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),

                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          context.read<RosaryCubit>().reset();
                        },
                        child: Text("Reset", style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
