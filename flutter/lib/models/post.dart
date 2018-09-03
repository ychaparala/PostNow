class MyPost {
  String category;
  String type;
  String title;
  String description;
  bool followme;
  // Map<double,double> geotag;
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
        followme = json['followme'];

  Map toJson(){ return {
        'category': category,
        'type': type,
        'title': title,
        'description': description,
        'followme': followme,
      };
  }
}
