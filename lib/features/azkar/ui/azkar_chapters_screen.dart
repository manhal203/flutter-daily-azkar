import 'package:daily_azkar/core/routes/route_keys.dart';
import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/azkar/bloc/azkar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AzkarChaptersScreen extends StatelessWidget {
  const AzkarChaptersScreen({super.key, required this.idCategory});
  final int idCategory;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Azkar Chapters"),
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
          child: BlocBuilder<AzkarBloc, AzkarState>(
            builder: (context, state) {
              if (state is AzkarInitial) {
                context.read<AzkarBloc>().add(LoadAzkarEvent(id: idCategory));

                return Center(child: CircularProgressIndicator());
              }
              if (state is LoadDataChaptersState) {
                return ListView.builder(
                  itemCount: state.chapters.length,
                  itemBuilder: (context, index) {
                    final chapter = state.chapters[index];

                    return Padding(
                      padding: .only(bottom: 10),
                      child: Card(
                        elevation: 3,
                        child: InkWell(
                          borderRadius: .circular(12),
                          onTap: () {
                            int azkarId = chapter.id;
                            context.push(
                              RouteKeys.azkarItemScreen,
                              extra: azkarId,
                            );
                          },
                          child: Padding(
                            padding: .symmetric(vertical: 18, horizontal: 16),
                            child: Row(
                              children: [
                                SizedBox(width: 12),

                                Expanded(
                                  child: Text(
                                    chapter.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16),
                              ],
                            ),
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
      ),
    );
  }
}
