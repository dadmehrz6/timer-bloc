// ignore_for_file: unused_element

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  TimerStarted({required this.duration});
  final int duration;

  @override
  String toString() {
    return "hi: '$duration";
  }
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  const TimerReset({this.duration});
  final int? duration;
}

final class _TimerTicked extends TimerEvent {
  _TimerTicked({required this.duration});
  final int duration;
}

void method(TimerEvent timerEvent) {
  switch (timerEvent) {
    case TimerStarted a:
      print('${a.duration}');
      print(timerEvent.duration);
      break;
    default:
  }
}

void main() {
  TimerStarted timerStarted = TimerStarted(duration: 1);

  // method(timerStarted);

  print(timerStarted);
}
