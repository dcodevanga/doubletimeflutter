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
                        MaterialPageRoute(builder: (context) => TimerApp()));
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
                    Container(
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
                  ],
                ),

                SizedBox(
                  height: 24,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      
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
                    SizedBox(
                      width: 24,
                    ),
                    Container(
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
                      ),
                  ),
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
                      ),
                  ),

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
                      ),
                  ),
                  
                ],
              ),
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
          ],
        ),
      );
  }
}