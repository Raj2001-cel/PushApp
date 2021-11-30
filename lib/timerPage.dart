// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class ElapsedTime {
//   final int hundreds;
//   final int seconds;
//   final int minutes;
//
//   ElapsedTime({
//     this.hundreds,
//     this.seconds,
//     this.minutes,
//   });
// }
//
// class Dependencies {
//
//   final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
//   final TextStyle textStyle = const TextStyle(fontSize: 5.0, fontFamily: "Bebas Neue");
//   final Stopwatch stopwatch = new Stopwatch();
//   final int timerMillisecondsRefreshRate = 30;
// }
//
// class TimerPage extends StatefulWidget {
//   TimerPage({Key key}) : super(key: key);
//
//   TimerPageState createState() => new TimerPageState();
// }
//
// class TimerPageState extends State<TimerPage> {
//   final Dependencies dependencies = new Dependencies();
//
//   void leftButtonPressed() {
//     setState(() {
//       if (dependencies.stopwatch.isRunning) {
//         print("${dependencies.stopwatch.elapsedMilliseconds}");
//       } else {
//         dependencies.stopwatch.reset();
//       }
//     });
//   }
//
//   void rightButtonPressed() {
//     setState(() {
//       if (dependencies.stopwatch.isRunning) {
//         dependencies.stopwatch.stop();
//       } else {
//         dependencies.stopwatch.start();
//       }
//     });
//   }
//
//   Widget buildFloatingButton(String text, VoidCallback callback) {
//     TextStyle roundTextStyle = const TextStyle(fontSize: 5.0, color: Colors.white);
//     return new FloatingActionButton(
//         child: new Text(text, style: roundTextStyle),
//         onPressed: callback);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         new Expanded(
//           child: new TimerText(dependencies: dependencies),
//         ),
//         new Expanded(
//           flex: 0,
//           child: new Padding(
//             padding: const EdgeInsets.symmetric(vertical: 0.0),
//             child: new Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 buildFloatingButton(dependencies.stopwatch.isRunning ? "lap" : "reset", leftButtonPressed),
//                 buildFloatingButton(dependencies.stopwatch.isRunning ? "stop" : "start", rightButtonPressed),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class TimerText extends StatefulWidget {
//   TimerText({this.dependencies});
//   final Dependencies dependencies;
//
//   TimerTextState createState() => new TimerTextState(dependencies: dependencies);
// }
//
// class TimerTextState extends State<TimerText> {
//   TimerTextState({this.dependencies});
//   final Dependencies dependencies;
//   Timer timer;
//   int milliseconds;
//
//   @override
//   void initState() {
//     timer = new Timer.periodic(new Duration(milliseconds: dependencies.timerMillisecondsRefreshRate), callback);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     timer = null;
//     super.dispose();
//   }
//
//   void callback(Timer timer) {
//     if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
//       milliseconds = dependencies.stopwatch.elapsedMilliseconds;
//       final int hundreds = (milliseconds / 10).truncate();
//       final int seconds = (hundreds / 100).truncate();
//       final int minutes = (seconds / 60).truncate();
//       final ElapsedTime elapsedTime = new ElapsedTime(
//         hundreds: hundreds,
//         seconds: seconds,
//         minutes: minutes,
//       );
//       for (final listener in dependencies.timerListeners) {
//         listener(elapsedTime);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         new RepaintBoundary(
//           child: new SizedBox(
//             height: 50.0,
//             child: new MinutesAndSeconds(dependencies: dependencies),
//           ),
//         ),
//         new RepaintBoundary(
//           child: new SizedBox(
//             height: 50.0,
//             child: new Hundreds(dependencies: dependencies),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class MinutesAndSeconds extends StatefulWidget {
//   MinutesAndSeconds({this.dependencies});
//   final Dependencies dependencies;
//
//   MinutesAndSecondsState createState() => new MinutesAndSecondsState(dependencies: dependencies);
// }
//
// class MinutesAndSecondsState extends State<MinutesAndSeconds> {
//   MinutesAndSecondsState({this.dependencies});
//   final Dependencies dependencies;
//
//   int minutes = 0;
//   int seconds = 0;
//
//   @override
//   void initState() {
//     dependencies.timerListeners.add(onTick);
//     super.initState();
//   }
//
//   void onTick(ElapsedTime elapsed) {
//     if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
//       setState(() {
//         minutes = elapsed.minutes;
//         seconds = elapsed.seconds;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String minutesStr = (minutes % 60).toString().padLeft(2, '0');
//     String secondsStr = (seconds % 60).toString().padLeft(2, '0');
//     return new Text('$minutesStr:$secondsStr.', style: dependencies.textStyle);
//   }
// }
//
// class Hundreds extends StatefulWidget {
//   Hundreds({this.dependencies});
//   final Dependencies dependencies;
//
//   HundredsState createState() => new HundredsState(dependencies: dependencies);
// }
//
// class HundredsState extends State<Hundreds> {
//   HundredsState({this.dependencies});
//   final Dependencies dependencies;
//
//   int hundreds = 0;
//
//   @override
//   void initState() {
//     dependencies.timerListeners.add(onTick);
//     super.initState();
//   }
//
//   void onTick(ElapsedTime elapsed) {
//     if (elapsed.hundreds != hundreds) {
//       setState(() {
//         hundreds = elapsed.hundreds;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
//     return new Text(hundredsStr, style: dependencies.textStyle);
//   }
// }



import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterStopWatch extends StatefulWidget {
   num totalTimeInSeconds;

   FlutterStopWatch(this.totalTimeInSeconds);

  @override
  _FlutterStopWatchState createState() => _FlutterStopWatchState(totalTimeInSeconds);

}

class _FlutterStopWatchState extends State<FlutterStopWatch> {
  bool flag = true;
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  int counter = 0;
  int totalTime;
  _FlutterStopWatchState(num newTick){
    hoursStr = ""+((newTick / (60 * 60)) % 60)
        .floor()
        .toString()
        .padLeft(2, '0');
    minutesStr = ""+((newTick / 60) % 60)
        .floor()
        .toString()
        .padLeft(2, '0');
    secondsStr =""+(newTick % 60).floor().toString().padLeft(2, '0');
    counter = newTick;
    totalTime = newTick;
  }


  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);


    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter--;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
height: 200,
      width: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$hoursStr:$minutesStr:$secondsStr",
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  padding:
                  EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  onPressed: () {
                    timerStream = stopWatchStream();
                    timerSubscription = timerStream.listen((int newTick) {
                      setState(() {
                        hoursStr = ((newTick / (60 * 60)) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        minutesStr = ((newTick / 60) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        secondsStr =
                            (newTick % 60).floor().toString().padLeft(2, '0');
                      });
                    });
                  },
                  color: Colors.green,
                  child: Text(
                    'START',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                RaisedButton(
                  padding:
                  EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  onPressed: () {
                    timerSubscription.cancel();
                    timerStream = null;
                    setState(() {
                      hoursStr = ""+(( totalTime/ (60 * 60)) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      minutesStr = ""+((totalTime / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      secondsStr =""+(totalTime % 60).floor().toString().padLeft(2, '0');
                      counter = totalTime;
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    'RESET',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}