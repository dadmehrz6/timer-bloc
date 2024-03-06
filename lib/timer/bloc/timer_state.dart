// ignore_for_file: prefer_const_constructors_in_immutables

part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  TimerInitial(super.duration);
}

final class TimerRunInProgress extends TimerState {
  TimerRunInProgress(super.duration);
}

final class TimerRunPause extends TimerState {
  TimerRunPause(super.duration);
}

final class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(0);
}
