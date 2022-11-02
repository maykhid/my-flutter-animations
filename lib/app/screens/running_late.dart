import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RunningLate extends StatefulWidget {
  const RunningLate({super.key});

  @override
  State<RunningLate> createState() => _RunningLateState();
}

class _RunningLateState extends State<RunningLate>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Running Late')),
    );
  }
}
