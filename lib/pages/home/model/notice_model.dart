class NoticesModel {
  int id;
  String title;
  String htmlUrl;
  String createdAt;

  NoticesModel({this.id, this.title, this.htmlUrl, this.createdAt});

  NoticesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    htmlUrl = json['html_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['html_url'] = this.htmlUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}
