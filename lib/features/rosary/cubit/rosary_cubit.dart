import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'rosary_state.dart';

class RosaryCubit extends Cubit<int> {
  RosaryCubit() : super(0);

  void increment() {
    HapticFeedback.lightImpact();
    emit(state + 1);
  }

  void reset() {
    emit(0);
  }
}
