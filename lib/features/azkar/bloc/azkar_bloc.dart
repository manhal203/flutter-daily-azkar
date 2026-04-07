import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'azkar_event.dart';
part 'azkar_state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  final muslimRepo = MuslimRepository();
  AzkarBloc() : super(AzkarInitial()) {
    on<LoadDataCatograyEvent>((event, emit) async {
      final List<AzkarCategory> categorys = await muslimRepo
          .getAzkarCategories();
      emit(LoadDataCatograyState(categories: categorys));
    });
    on<LoadAzkarEvent>((event, emit) async {
      final chapters = await muslimRepo.getAzkarChapters(
        language: Language.en,
        categoryId: event.id,
      );
      emit(LoadDataChaptersState(chapters: chapters));
    });
    on<LoadAzkarItemEvent>((event, emit) async {
      final items = await muslimRepo.getAzkarItems(
        chapterId: event.id,
        language: Language.en,
      );
      emit(LoadDataItemsState(items: items));
    });
  }
}
