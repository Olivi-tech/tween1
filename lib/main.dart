import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double customOpacity = 0.0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.orangeAccent,
        // height:MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    customOpacity = 1.0;
                  });
                },
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 2),
                tween: Tween<double>(begin: 30, end: 100),
                builder: (BuildContext context, double value, Widget? child) {
                  return Icon(
                    Icons.flash_on,
                    size: value,
                    color: Colors.green,
                  );
                }),
            AnimatedOpacity(
              opacity: customOpacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Charging',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
