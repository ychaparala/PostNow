import 'package:flutter/material.dart';
// import 'dart:async';

class AppFab extends StatefulWidget {
  @override
  _AppFabState createState() => _AppFabState();
}

class _AppFabState extends State<AppFab> with TickerProviderStateMixin{
  AnimationController _controller;
  static const List<IconData> icons = const [ Icons.restaurant,Icons.shopping_cart, ];
  static const List<String> nav = const ["/AddPublisherPage","/AddSubscriberPage",];

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                  0.0,
                  1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut
                ),
              ),
              child: new FloatingActionButton(
                heroTag: null,
                // backgroundColor: backgroundColor,
                mini: true,
                // child: new Icon(icons[index], color: foregroundColor),
                child: new Icon(icons[index]),
                onPressed: () { Navigator.of(context).pushNamed(nav[index]); _controller.reverse();},
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * 3.14),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.add : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
      // ),
    );
  }
}