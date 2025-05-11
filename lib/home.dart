import 'package:flutter/material.dart';
import 'package:doubletimeflutter/timer.dart';
import 'package:wheel_picker/wheel_picker.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int seconds = 0;
    int minutes = 0;
    int hours = 0;
    int durationFromWheel = 0;
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(48),
              height: 86,
              decoration: BoxDecoration(color: Colors.deepOrangeAccent, borderRadius: BorderRadius.circular(25.0),),
              alignment: Alignment.center,
              child: Text(
                "double time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimerApp(durationInSeconds: 300)));
                      },
                      child: Container(
                        
                        height: 86,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "5 min",
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp(durationInSeconds: 900)));
                      },
                      child: Container(
                        height: 86,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            "15 min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 24,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp(durationInSeconds: 1800)));
                      },
                      child: Container(
                        height: 86,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "30 min",
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp(durationInSeconds: 3600)));
                      },
                      child: Container(
                        height: 86,
                        width: 86,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            "1 hour",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 86,
              margin: EdgeInsets.all(48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  //hours picker
                  Expanded(
                    child: WheelPicker(
                      builder: (context, index) => Text(
                        "$index",
                         style: TextStyle(
                           color: Colors.grey[300],
                           fontSize: 18,
                           ),
                           ),
                      controller: WheelPickerController(itemCount: 24),
                      selectedIndexColor: Colors.white,
                      onIndexChanged: (index, interactionType) {
                        hours = index;
                      },
                      ),
                  ),
                  //minutes wheel
                  Expanded(
                    child: WheelPicker(
                      builder: (context, index) => Text(
                        "$index",
                         style: TextStyle(
                           color: Colors.grey[300],
                           fontSize: 18,
                           ),
                           ),
                      controller: WheelPickerController(itemCount: 60),
                      selectedIndexColor: Colors.white,
                      onIndexChanged: (index, interactionType) {
                        minutes = index;
                      },
                      ),
                  ),
                  //seconds wheel
                  Expanded(
                    child: WheelPicker(
                      builder: (context, index) => Text(
                        "$index",
                         style: TextStyle(
                           color: Colors.grey[300],
                           fontSize: 18,
                           ),
                           ),
                      controller: WheelPickerController(itemCount: 60),
                      selectedIndexColor: Colors.white,
                      onIndexChanged: (index, interactionType) {
                        seconds = index;
                      },
                      ),
                  ),
                  
                ],
              ),
            ),

            SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                durationFromWheel = seconds + (minutes * 60) + (hours * 60 * 60);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp(durationInSeconds: durationFromWheel)));
              },
              child: Container(
                height: 86,
                margin: EdgeInsets.all(48),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}