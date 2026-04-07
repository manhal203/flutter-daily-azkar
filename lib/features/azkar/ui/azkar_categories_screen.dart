import 'package:daily_azkar/core/routes/route_keys.dart';
import 'package:daily_azkar/core/theme/bloc/theme_bloc.dart';
import 'package:daily_azkar/features/azkar/bloc/azkar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCategoriesScreen extends StatelessWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Azkar Categories"),
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
                      context.read<AzkarBloc>().add(LoadDataCatograyEvent());
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is LoadDataCatograyState) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 0.8,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                        shrinkWrap: true,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final categorie = state.categories[index];

                          return Card(
                            elevation: 4,
                            child: InkWell(
                              borderRadius: .circular(10),
                              onTap: () {
                                int azkarId = categorie.id;
                                context.push(
                                  RouteKeys.azkarChaptersScreen,
                                  extra: azkarId,
                                );
                              },
                              child: Center(
                                child: Text(
                                  categorie.name,
                                  style: TextStyle(
                                    fontWeight: .bold,
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
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
            ],
          ),
        ),
      ),
    );
  }
}
