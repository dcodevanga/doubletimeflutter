import 'package:flutter/material.dart';
import 'package:doubletimeflutter/timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:wheel_picker/wheel_picker.dart';
import 'package:doubletimeflutter/time_service.dart';
import 'package:doubletimeflutter/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  int durationFromWheel = 0;
  int selectedIndex = 0;
  int saveTime = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedTime(); // ✅ load on screen start
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    // Called when coming back to this screen
    _loadSavedTime();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  Future<void> _loadSavedTime() async {
    final time = await TimeService.getSavedTimeInt();

    setState(() {
      saveTime = (time is int) ? time : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final durationF = Duration(seconds: saveTime);
    final hoursF = durationF.inHours;
    final minutesF = durationF.inMinutes % 60;
    final secondsF = durationF.inSeconds % 60;

    final formattedTime =
        '${hoursF.toString().padLeft(2, '0')}:${minutesF.toString().padLeft(2, '0')}:${secondsF.toString().padLeft(2, '0')}';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(25.0),
              ),
              alignment: Alignment.center,
              child: Text(
                formattedTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+5%",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "from yesterday",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TimerApp(durationInSeconds: 300),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "5 min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TimerApp(durationInSeconds: 900),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "15 min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TimerApp(durationInSeconds: 1800),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "30 min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TimerApp(durationInSeconds: 3600),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "1 hour",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1, 
                vertical: MediaQuery.of(context).size.height * 0.05),
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
                      builder:
                          (context, index) => Text(
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
                      builder:
                          (context, index) => Text(
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
                      builder:
                          (context, index) => Text(
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

            GestureDetector(
              onTap: () async {
                durationFromWheel =
                    seconds + (minutes * 60) + (hours * 60 * 60);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            TimerApp(durationInSeconds: durationFromWheel),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),

            selectedColor: Colors.deepOrangeAccent,
            unSelectedColor: Colors.grey,
          ),
          BottomBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Stats'),
            selectedColor: Colors.deepOrangeAccent,
            unSelectedColor: Colors.grey,
          ),
          BottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            selectedColor: Colors.deepOrangeAccent,
            unSelectedColor: Colors.grey,
          ),
        ],
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          opacity: 0.3,
        ),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}