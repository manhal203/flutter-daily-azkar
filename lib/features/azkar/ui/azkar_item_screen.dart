import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/azkar/bloc/azkar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarItemScreen extends StatelessWidget {
  const AzkarItemScreen({super.key, required this.chapterId});
  final int chapterId;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Zekr"),
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
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: BlocBuilder<AzkarBloc, AzkarState>(
                  builder: (context, state) {
                    if (state is AzkarInitial) {
                      context.read<AzkarBloc>().add(
                        LoadAzkarItemEvent(id: chapterId),
                      );
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is LoadDataItemsState) {
                      return ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final zekr = state.items[index];

                          return Padding(
                            padding: .only(bottom: 14),
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: .all(18),
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      zekr.item,
                                      textAlign: .right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        height: 1.8,
                                        fontWeight: .bold,
                                      ),
                                    ),

                                    SizedBox(height: 14),

                                    Text(
                                      zekr.translation,
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.6,
                                      ),
                                    ),

                                    SizedBox(height: 12),

                                    Align(
                                      alignment: .centerLeft,
                                      child: Text(
                                        zekr.reference,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Icon(Icons.error));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
