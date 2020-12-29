class CountryModel {
  String areaCode;
  String name;
  String nameUS;

  CountryModel({
    this.areaCode,
    this.name,
    this.nameUS,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    areaCode = json['id'];
    name = json['name'];
    nameUS = json['nameUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.areaCode;
    data['name'] = this.name;
    data['nameUS'] = this.nameUS;
    return data;
  }
}