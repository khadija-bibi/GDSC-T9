import 'package:animations/customPageRoute.dart';
import 'package:animations/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  bool isTick = false;
  late AnimationController animationController;

  bool selected = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: GestureDetector(
              onTap: () {
                if (isTick == false) {
                  animationController.forward();
                  isTick = true;
                } else {
                  animationController.reverse();
                  isTick = false;
                }
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.pause_play,
                size: 150,
                color: Colors.deepPurple,
                progress: animationController,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CustomPageRoute(child: Screen2()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black)),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: selected
                    ? BorderRadius.circular(2)
                    : BorderRadius.circular(0),
                color: selected ? Colors.black : Colors.pinkAccent,
              ),
              child: Center(
                  child: Text("click me",
                      style: TextStyle(fontSize: 25, color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }
}
