import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUsecase adviceUsecase = AdviceUsecase();

  void adviceRequested() async {
    emit(AdvicerOnLoadingState());
    final advice = await adviceUsecase.getAdvice();
    emit(AdvicerOnLoadedState(advice: advice.advice));
  }
}
