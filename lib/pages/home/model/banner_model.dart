class BannerModel {
  String title;
  String picture;
  String link;

  BannerModel({this.title, this.picture, this.link});

  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    picture = json['picture'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['picture'] = this.picture;
    data['link'] = this.link;
    return data;
  }
}
