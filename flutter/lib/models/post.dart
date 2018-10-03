class MyPost {
  String key;
  String category;
  String type;
  String title;
  String description;
  bool followme;
  Map<dynamic,dynamic> location;
  // bool hasImage;
  // String featureImageURL;
  // bool hasGeoTag;
  // int datetime;

  MyPost({
    this.category,
    this.type,
    this.title,
    this.description,
    this.followme = false,
    this.location,
    // this.geotag,
    // @required this.hasImage,
    // this.featureImageURL,
    // @required this.hasGeoTag,
    // @required this.datetime,
  });

  MyPost.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        type = json['type'],
        title = json['title'],
        description = json['description'],
        followme = json['followme'],
        location = json["location"];

  Map toJson(){ return {
        'category': category,
        'type': type,
        'title': title,
        'description': description,
        'followme': followme,
        'location': location,
      };
  }
}
