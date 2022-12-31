import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _bool1 = true;
  bool _bool2 = true;
  double _fontSize = 40;
  Color _fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _bool1 = !_bool1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Click Me",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black)),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: AnimatedCrossFade(
                firstChild:
                    Image.asset("asset/sunrise.jpg", height: 150, width: 200),
                secondChild:
                    Image.asset("asset/sunset.jpg", height: 150, width: 200),
                crossFadeState: _bool1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 2)),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fontSize = _bool2 ? 50 : 40;
                    _fontColor = _bool2 ? Colors.pinkAccent : Colors.black;
                    _bool2 = !_bool2;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Click Me",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black)),
          ),
          SizedBox(
            height: 40,
          ),
          AnimatedDefaultTextStyle(
            child: Text("CHANGES"),
            style: TextStyle(
              fontSize: _fontSize,
              color: _fontColor,
            ),
            duration: Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}
