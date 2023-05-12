import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../../domain/failures/failures.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit({required this.adviceUsecase}) : super(AdvicerInitial());
  final AdviceUsecase adviceUsecase;

  void adviceRequested() async {
    emit(AdvicerOnLoadingState());
    final adviceOrFailure = await adviceUsecase.getAdvice();
    adviceOrFailure.fold(
      (failure) =>
          emit(AdvicerOnErrorState(message: _mapFailureToMessage(failure))),
      (r) => emit(AdvicerOnLoadedState(advice: r.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
