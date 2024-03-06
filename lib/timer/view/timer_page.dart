// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/ticker.dart';
import 'package:timer/timer/bloc/timer_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker()),
      child: TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: TimerText()),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final int duration =
        context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');

    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class Actions extends StatelessWidget {
  Actions({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    onPressed: () => context
                        .read<TimerBloc>()
                        .add(TimerStarted(duration: state.duration)),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              TimerRunInProgress() => [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerPaused()),
                    child: Icon(Icons.pause),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerReset()),
                    child: Icon(Icons.replay),
                  ),
                ],
              TimerRunPause() => [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerResumed()),
                    child: Icon(Icons.play_arrow),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<TimerBloc>().add(TimerReset()),
                    child: Icon(Icons.replay),
                  ),
                ],
              TimerRunComplete() => [
                  Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () =>
                            context.read<TimerBloc>().add(TimerReset()),
                        child: Icon(Icons.replay),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TextField(
                          controller: _textController,
                          maxLength: 3,
                          decoration:
                              InputDecoration(focusColor: Colors.deepPurple),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            int duration = int.parse(_textController.text);
                            context
                                .read<TimerBloc>()
                                .add(TimerReset(duration: duration));
                          },
                          child: Text('Sumbit')),
                    ],
                  )
                ],
            }
          ],
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.indigo,
            Colors.blue.shade300,
          ],
          radius: 0.6,
        ),
      ),
    );
  }
}
