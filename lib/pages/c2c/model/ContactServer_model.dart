class ContactServerModel {
  int id;
  String name;
  String value;
  String createdAt;
  String updatedAt;

  ContactServerModel(
      {this.id, this.name, this.value, this.createdAt, this.updatedAt});

  ContactServerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}