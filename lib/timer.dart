import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "10 min",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "00:05:00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.white,
                      ),
                    SizedBox(width: 12,),
                    Text(
                      "10:00",
                      style: TextStyle(
                        color: Colors.white,
                    
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      
                    },
                    child: Container(
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
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
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.all(48),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                "finish",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 64,
            
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}