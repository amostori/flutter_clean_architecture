part of 'advicer_cubit.dart';

@immutable
abstract class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerState {}

class AdvicerOnLoadingState extends AdvicerState {}

class AdvicerOnLoadedState extends AdvicerState {
  final String advice;

  AdvicerOnLoadedState({required this.advice});
}

class AdvicerOnErrorState extends AdvicerState {}
