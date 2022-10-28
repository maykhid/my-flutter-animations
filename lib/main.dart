import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bouncing Ball'),
    );
  }
}

/// This code is a simple animation of a ball that starts and stops bouncing when the ball is pressed.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _bouncingController;
  late AnimationController _rotationController;
  // late Animation<double> _height;
  late Animation _curve;
  late Animation<Offset> _offset;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _bouncingController = AnimationController(
      duration: const Duration(milliseconds: 500),
      // upperBound: 500,
      // lowerBound: 0,
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      // upperBound: 500,
      // lowerBound: 0,
      vsync: this,
    );

    _curve = CurvedAnimation(
        parent: _bouncingController,
        curve: Curves.fastLinearToSlowEaseIn, // slow the ball down on getting to the top
        reverseCurve: Curves.fastLinearToSlowEaseIn);

    //? TweenSequence - I would simply define this as an array of tweens(TweenSequenceItem) you might want to animate through, it starts from the first item tween performs the interpolation and goes to the next tween item. Leaving this here for ref
    // _height = TweenSequence(<TweenSequenceItem<double>>[
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 0, end: 500), weight: 50),
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 500, end: 0), weight: 50),
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 0, end: 300), weight: 50),
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 300, end: 0), weight: 50),
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 0, end: 100), weight: 50),
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 100, end: 0), weight: 50),
    // ]).animate(_curve as Animation<double>);

    // _offset = TweenSequence(<TweenSequenceItem<Offset>>[
    //   TweenSequenceItem<Offset>(
    //       tween: Tween<Offset>(
    //           begin: const Offset(0, 0), end: const Offset(0, -100)),
    //       weight: 70),
    //   // TweenSequenceItem<Offset>(
    //   // tween: Tween<Offset>(begin: const Offset(0, -40), end: const Offset(0, 0)), weight: 50),
    //   // TweenSequenceItem<Offset>(
    //   // tween: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -40)), weight: 50),
    //   // // TweenSequenceItem<Offset>(
    //   // tween: Tween<Offset>(begin: const Offset(0, -70), end: const Offset(0, 0)), weight: 50),
    // ]).animate(_curve as Animation<double>);

    //? Tween<T>.animate - This basically is a class that makes a particular animation interpolate between a ‘begin’ value and an ‘end’ value. 
    _offset =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -250))
            .animate(_curve as Animation<double>);

    _opacity = Tween<double>(begin: 1.0, end: 0.3)
        .animate(_curve as Animation<double>);

    // _opacity = TweenSequence(<TweenSequenceItem<double>>[
    //   TweenSequenceItem<double>(
    //       tween: Tween<double>(begin: 1.0, end: 0.0), weight: 70),
    // ]).animate(_curve as Animation<double>);

    // rotation controller - repeats when animation completes
    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationController.repeat();
      }
    });

    // bouncing controller - reverses on completed and forwards on completion of reverse
    _bouncingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _bouncingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _bouncingController.forward();
      }
    });
  }

  @override
  void dispose() {
    _bouncingController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _bouncingController,
            builder: (_, __) {
              return InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  if (_bouncingController.isAnimating) {
                    // stop animation
                    _bouncingController.stop();
                    _rotationController.stop();
                  } else {
                    // continue animation from where it stopped
                    _bouncingController.forward(from: _bouncingController.value);
                    _rotationController.forward(from: _rotationController.value);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ball
                    Transform.translate(
                        offset: _offset.value, // uses the offset value to move the ball upwards and downwards
                        child: RotationTransition(
                          turns: _rotationController,
                          child: SizedBox(
                              // color: Colors.black,
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/images/ball.png')),
                        )),

                    // shadow
                    Opacity(
                      opacity: _opacity.value,
                      child: Container(
                        width: _opacity.value * 10,
                        height: _opacity.value * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class RotationTransition extends AnimatedWidget {
//   const RotationTransition({
//     Key? key,
//     required AnimationController rotationController,
//   }) : super(key: key, listenable: rotationController);

//   // final AnimationController _rotationController;

//   @override
//   Widget build(BuildContext context) {
//     AnimationController animation = listenable as AnimationController;
//     return Transform.rotate(
//       angle: animation.value * 5 ,
//       child: SizedBox(
//           // color: Colors.black,
//           height: 40,
//           width: 40,
//           child: Image.asset('lib/ball.png')),
//     );
//     //   }
//     // );
//   }
// }

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
