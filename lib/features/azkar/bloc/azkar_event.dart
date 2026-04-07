part of 'azkar_bloc.dart';

@immutable
sealed class AzkarEvent {}

class LoadDataCatograyEvent extends AzkarEvent {}

class LoadAzkarEvent extends AzkarEvent {
  final int id;
  LoadAzkarEvent({required this.id});
}

class LoadAzkarItemEvent extends AzkarEvent {
  final int id;
  LoadAzkarItemEvent({required this.id});
}
