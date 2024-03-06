// ignore_for_file: unused_element

part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  TimerStarted({required this.duration});
  final int duration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset({this.duration});
  final int? duration;
}

class _TimerTicked extends TimerEvent {
  _TimerTicked({required this.duration});
  final int duration;
}
