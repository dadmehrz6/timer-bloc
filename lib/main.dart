import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/app.dart';
import 'package:timer/timer_observer.dart';

void main() {
  Bloc.observer = TimerObserver();
  runApp(const App());
}
