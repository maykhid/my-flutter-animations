// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';

/// This animation tries to mimick the loading animation on the official Flutter Animation series episode 2.
/// My solution (which i'm unsure if it's the best solution) came out pretty good.
/// The code below shows solutions that didn't work they are commented out.

class MultiBouncingBalls extends StatefulWidget {
  const MultiBouncingBalls({super.key});

  @override
  State<MultiBouncingBalls> createState() => _MultiBouncingBallsState();
}

class _MultiBouncingBallsState extends State<MultiBouncingBalls>
    with TickerProviderStateMixin {
  late AnimationController ballController1;
  late AnimationController ballController2;
  late AnimationController ballController3;
  late AnimationController ballController4;
  late AnimationController ballController5;

  @override
  void initState() {
    super.initState();

    ballController1 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    ballController2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    ballController3 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    ballController4 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    ballController5 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // ballController1.repeat();
    // if (ballController1.value > 0.4) {
    //   ballController2.forward();
    // }

    // ballController1.forward();

    //! This solution used a Future.delayed to forward each controller. This did not work or the animation did not look right becuase
    //! each controller had to finish animating before the next controller began forwarding
    // Future.delayed(
    //     const Duration(milliseconds: 0),
    //     () => ballController1.forward().then((value) => Future.delayed(
    //         const Duration(milliseconds: 100),
    //         () => ballController2.forward().then((value) => Future.delayed(
    //             const Duration(milliseconds: 100),
    //             () => ballController3.forward().then((value) => Future.delayed(
    //                 const Duration(milliseconds: 100),
    //                 () => ballController4.forward().then(
    //                     (value) => Future.delayed(const Duration(milliseconds: 100), (() => ballController5.forward()))))))))));

    // Future.delayed(const Duration(milliseconds: 20), () {
    //   ballController2.forward();
    //   ballController3.forward();
    //   ballController4.forward();
    //   ballController5.forward();
    // });

    //? This is the right solution, set a delay of 60 secs apart for each controller asides the first controller to begin forwarding, the first controller start immediately
    // Future.delayed(const Duration(milliseconds: 0), () {
      ballController1.forward();
    // });

    Future.delayed(const Duration(milliseconds: 60), () {
      ballController2.forward();
    });

    Future.delayed(const Duration(milliseconds: 120), () {
      ballController3.forward();
    });
    //
    Future.delayed(const Duration(milliseconds: 180), () {
      ballController4.forward();
    });
    //
    Future.delayed(const Duration(milliseconds: 240), () {
      ballController5.forward();
    });

    ballController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController1.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ballController1.forward();
      }
    });

    ballController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController2.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ballController2.forward();
      }
    });

    ballController3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController3.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ballController3.forward();
      }
    });

    ballController4.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController4.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ballController4.forward();
      }
    });
    ballController5.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController5.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ballController5.forward();
      }
    });
  }

  @override
  void dispose() {
    ballController1.dispose();
    ballController2.dispose();
    ballController3.dispose();
    ballController4.dispose();
    ballController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Bouncing balls'),
      ),
      body: Center(
        child: SizedBox(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UpwardTransition(
                controller: ballController1,
                // offset: offsetAnimation1,
              ),
              UpwardTransition(
                controller: ballController2,
                // offset: offsetAnimation2,
              ),
              UpwardTransition(
                controller: ballController3,
              ),
              UpwardTransition(
                controller: ballController4,
              ),
              UpwardTransition(
                controller: ballController5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpwardTransition extends AnimatedWidget {
  const UpwardTransition({Key? key, required Animation<double> controller})
      : super(key: key, listenable: controller);

  // final AnimationController _controller;
  // final Animation<Offset> offset;

  @override
  Widget build(BuildContext context) {
    Animation<double> controller = listenable as Animation<double>;
    return Transform.translate(
      offset: constructOffset(controller).value,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  //? This gives each controller their curve and offset property (To reduce boiler plate code)
  Animation<Offset> constructOffset(Animation<double> controller) {
    final curve = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut, // slow the ball down on getting to the top
        reverseCurve: Curves.easeInOut);
    final offset =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -40))
            .animate(curve);
    return offset;
  }
}
