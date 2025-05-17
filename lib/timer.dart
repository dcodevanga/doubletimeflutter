import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doubletimeflutter/time_service.dart';

class TimerApp extends StatefulWidget {
  final int durationInSeconds;

  const TimerApp({super.key, required this.durationInSeconds});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  final CountDownController _controller = CountDownController();
  final CountDownController negativeController = CountDownController();

  bool isPaused = false;
  bool isNegative = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final alarmTime = now.add(Duration(seconds: widget.durationInSeconds));
    final DateFormat dateFormat = DateFormat('HH:mm:ss');
    final alarmTimeFormat = dateFormat.format(alarmTime);

    final duration = Duration(seconds: widget.durationInSeconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    final formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 256,
            alignment: Alignment.center,
            margin: EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(formattedTime, style: TextStyle(color: Colors.white)),
                if (!isNegative) ...[
                  CircularCountDownTimer(
                    key: ValueKey("positive"),
                    width: 120,
                    height: 120,
                    duration: widget.durationInSeconds,
                    isReverse: true,
                    fillColor: Colors.white,
                    ringColor: Colors.black,
                    controller: _controller,
                    isReverseAnimation: true,

                    onComplete: () {
                      setState(() {
                        isNegative = true;                        
                      });
                      Future.delayed(Duration(milliseconds: 100), () {
                        negativeController.start();
                      });
                    },
                  ),
                ] else ...[
                  CircularCountDownTimer(
                    key: ValueKey("negative"),
                    width: 120,
                    height: 120,
                    duration: 86400,
                    fillColor: Colors.white,
                    ringColor: Colors.black,
                    controller: negativeController,
                    autoStart: false,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                // CircularCountDownTimer(
                //   width: 120,
                //   height: 120,
                //   duration: widget.durationInSeconds,
                //   isReverse: true,
                //   fillColor: Colors.white,
                //   ringColor: Colors.black,
                //   controller: _controller,
                //   isReverseAnimation: true,

                //   onComplete: () {

                //     setState(() {
                //       isNegative = true;
                //     });

                //   },

                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.alarm, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      alarmTimeFormat.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isPaused) {
                        _controller.pause();
                        setState(() {
                          isPaused = true;
                        });
                      } else if (isPaused) {
                        _controller.resume();
                        setState(() {
                          isPaused = false;
                        });
                      }
                    },
                    child: Container(
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        isPaused ? Icons.play_arrow : Icons.pause,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.cancel, color: Colors.white, size: 48),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: () async {
              int saveTime;
              if(!isNegative){
                saveTime = parseToSeconds(_controller.getTime().toString());
              }
              else {
                var negative = parseToSeconds(negativeController.getTime().toString());
                saveTime = -negative;
              }
              final time = await TimeService.getSavedTimeInt();
              int prefTime = (time is int) ? time : 0;
              prefTime = prefTime + saveTime;
              TimeService.saveTimeInt(prefTime);
              Navigator.pop(context, saveTime);

            },
            child: Container(
              height: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.all(48),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "finish",
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
int parseToSeconds(String timeString) {
  final parts = timeString.split(':').map(int.parse).toList();

  if (parts.length == 1) {
    // Only seconds
    return parts[0];
  } else if (parts.length == 2) {
    // Minutes : Seconds
    return parts[0] * 60 + parts[1];
  } else if (parts.length == 3) {
    // Hours : Minutes : Seconds
    return parts[0] * 3600 + parts[1] * 60 + parts[2];
  } else {
    throw FormatException("Invalid time format: $timeString");
  }
}

