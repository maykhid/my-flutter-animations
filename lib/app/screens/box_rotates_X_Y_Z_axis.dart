// ignore: file_names

///* Note to Self:
/// pi = 180°, 2pi = 360°
/// alignment param in Transform, dictates the pivot point e.g topLeft - means hold the top left corner of the widget
///
import 'dart:math';

import 'package:flutter/material.dart';

class RotateBoxAroundYAxis extends StatefulWidget {
  const RotateBoxAroundYAxis({super.key});

  @override
  State<RotateBoxAroundYAxis> createState() => _RotateBoxAroundYAxisState();
}

class _RotateBoxAroundYAxisState extends State<RotateBoxAroundYAxis>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    // generate values from 0 --> 2 * pi (in rad), basically from 0 - 360° (in degrees)
    _rotation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_rotationController);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Box Around X-Y-Z Axis'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // X - Axis Rotation
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _rotation,
                  builder: (context, _) {
                    return Transform(
                      transform: Matrix4.identity()..rotateX(_rotation.value),
                      alignment: Alignment.center,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
              const Text('X - Axis Rotation'),
            ],
          ),

          // Y - Axis Rotation
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _rotation,
                  builder: (context, _) {
                    return Transform(
                      transform: Matrix4.identity()..rotateY(_rotation.value),
                      alignment: Alignment.center,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
              const Text('Y - Axis Rotation')
            ],
          ),

          // Z - Axis Rotation
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _rotation,
                  builder: (context, _) {
                    return Transform(
                      transform: Matrix4.identity()..rotateZ(_rotation.value),
                      alignment: Alignment.center,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
              const Text('Z - Axis Rotation')
            ],
          ),
        ],
      ),
    );
  }
}
