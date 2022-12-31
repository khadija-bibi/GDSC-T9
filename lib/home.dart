import 'package:animations/customPageRoute.dart';
import 'package:animations/screen1.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  double rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.repeat(reverse: true);
    animationController.addListener(() {
      setState(() {
        rotationAngle = animationController.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("asset/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 30.0),
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Icon(
                    Icons.camera,
                    color: Colors.black38,
                    size: 300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(CustomPageRoute(child: Screen1()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Click Here",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black))
          ],
        ),
      ),
    );
  }
}
