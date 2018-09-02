import 'package:flutter/material.dart';
import 'package:first_app/components/drawer.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
      ),
        body: new Center(
            child: new Text('Hello in Settings Page!'),
            ),
        drawer: new AppDrawer(),
      );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:math' as math;


// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();

//   // @override
//   // State createState() => new _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> with TickerProviderStateMixin{
//   AnimationController _controller;

//   static const List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.phone ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//   }

//   Widget build(BuildContext context) {
//     Color backgroundColor = Theme.of(context).cardColor;
//     Color foregroundColor = Theme.of(context).accentColor;
//     return new Scaffold(
//       appBar: new AppBar(title: new Text('Speed Dial Example')),
//       floatingActionButton: new Column(
//         mainAxisSize: MainAxisSize.min,
//         children: new List.generate(icons.length, (int index) {
//           Widget child = new Container(
//             height: 70.0,
//             width: 56.0,
//             alignment: FractionalOffset.topCenter,
//             child: new ScaleTransition(
//               scale: new CurvedAnimation(
//                 parent: _controller,
//                 curve: new Interval(
//                   0.0,
//                   1.0 - index / icons.length / 2.0,
//                   curve: Curves.easeOut
//                 ),
//               ),
//               child: new FloatingActionButton(
//                 heroTag: null,
//                 backgroundColor: backgroundColor,
//                 mini: true,
//                 child: new Icon(icons[index], color: foregroundColor),
//                 onPressed: () {},
//               ),
//             ),
//           );
//           return child;
//         }).toList()..add(
//           new FloatingActionButton(
//             heroTag: null,
//             child: new AnimatedBuilder(
//               animation: _controller,
//               builder: (BuildContext context, Widget child) {
//                 return new Transform(
//                   transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.PI),
//                   alignment: FractionalOffset.center,
//                   child: new Icon(_controller.isDismissed ? Icons.share : Icons.close),
//                 );
//               },
//             ),
//             onPressed: () {
//               if (_controller.isDismissed) {
//                 _controller.forward();
//               } else {
//                 _controller.reverse();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }