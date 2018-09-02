import 'package:flutter/material.dart';
class MyPost{
  final String category;
  final String type;
  final String title;
  final String description;
  final bool followme;
  final Map<double,double> geotag;
  final bool hasImage;
  final String featureImageURL;
  final bool hasGeoTag;
  final int datetime;

  MyPost({
    @required this.category,
    @required this.type,
    @required this.title,
    @required this.description,
    @required this.followme,
    this.geotag,
    @required this.hasImage,
    this.featureImageURL,
    @required this.hasGeoTag,
    @required this.datetime,
  });
}