import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  Bubble(
      {this.message,
      this.time,
      this.delivered,
      this.isMe,
      this.animationController});

  final AnimationController animationController;
  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.greenAccent : Colors.greenAccent.shade100;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          );
    // return new SizeTransition(
      // sizeFactor: new CurvedAnimation(
      //     parent: animationController, 
      //     curve: Curves.easeOut
      //   ),
      // child: Column(
      return new Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: .5,
                    spreadRadius: 1.0,
                    color: Colors.black.withOpacity(.12))
              ],
              color: bg,
              borderRadius: radius,
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 48.0),
                  child: Text(message,style: TextStyle(color: Colors.black),),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Row(
                    children: <Widget>[
                      Text(time,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 10.0,
                          )),
                      SizedBox(width: 3.0),
                      Icon(
                        icon,
                        size: 12.0,
                        color: Colors.black38,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      // ),
    );
  }
}
