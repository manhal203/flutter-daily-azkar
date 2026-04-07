part of 'azkar_bloc.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class LoadDataCatograyState extends AzkarState{
  final List<AzkarCategory> categories;

  LoadDataCatograyState({required this.categories});
}

final class LoadDataChaptersState extends AzkarState{
  final List<AzkarChapter> chapters;

  LoadDataChaptersState({required this.chapters});
}
final class LoadDataItemsState extends AzkarState{
  final List<AzkarItem> items;

  LoadDataItemsState({required this.items});
}