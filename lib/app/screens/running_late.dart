// import 'package:flutter/material.dart';

// class RunningLate extends StatefulWidget {
//   const RunningLate({super.key});

//   @override
//   State<RunningLate> createState() => _RunningLateState();
// }

// class _RunningLateState extends State<RunningLate>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Running Late'),
//       ),
//       body: Center(
//         child: Stack(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           alignment: Alignment.bottomCenter,
//           children: [
//             Transform(
//               transform: Matrix4.skew(4.5, 9.2),
//               child: SizedBox(
//                 width: 550,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(height: 50, width: 50, color: Colors.black,),
//                      Container(height: 50, width: 50, color: Colors.black,),
//                       Container(height: 50, width: 50, color: Colors.black,),
//                        Container(height: 50, width: 50, color: Colors.black,),
//                        Container(height: 50, width: 50, color: Colors.black,),
//                        Container(height: 50, width: 50, color: Colors.black,),
//                        Container(height: 50, width: 50, color: Colors.black,),
//                       //  Container(height: 50, width: 50, color: Colors.black,),
//                   ],
//                 ),
//               ),
//             ),
          
//             Image.asset('assets/images/run-busy.gif', height: 125.0,
//   width: 125.0,),
//             ],
//         ),
//       ),
//     );
//   }
// }
