import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:first_app/globals.dart';

class AnimatedMapControllerPage extends StatefulWidget {
  static const String route = 'map_controller_animated';

  @override
  AnimatedMapControllerPageState createState() {
    return new AnimatedMapControllerPageState();
  }
}

class AnimatedMapControllerPageState extends State<AnimatedMapControllerPage> with TickerProviderStateMixin {

  MapController mapController;

  void initState() {
    super.initState();
    mapController = new MapController();
  }

  Widget build(BuildContext context) {
    var markers = <Marker>[
      new Marker(
        width: 45.0,
        height: 45.0,
        point: new LatLng(currentLocation["latitude"],currentLocation["longitude"]),
        builder: (ctx) => new Container(
          key: new Key("blue"),
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.red,
            iconSize: 45.0,
            onPressed: (){
              print('Marker tapped');
            },
          ) 
        ),
      ),
    ];

    return new Container(
      child: new Padding(
        padding: new EdgeInsets.all(2.0),
        child: new Column(
          children: [
            new Flexible(
              child: new FlutterMap(
                mapController: mapController,
                options: new MapOptions(
                    center: new LatLng(currentLocation["latitude"],currentLocation["longitude"]),
                    zoom: 14.0,
                    // maxZoom: 5.0,
                    minZoom: 3.0
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:map_native/map_native.dart';
// import 'package:first_app/globals.dart';

// class AnimatedMapControllerPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final inline0 = new Card(
//         child: new Stack(
//       children: [
//         new MapView(initialLocation: new LatLong (currentLocation["latitude"],currentLocation["longitude"]), inititialZoom: 14.0),
//       ],
//     ));

//     return new Column(children: [
//       new Flexible(
//         child: inline0,
//       ),
//     ]);
//   }
// }