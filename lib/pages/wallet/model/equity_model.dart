class EquityModel {
  String name;
  num profits;
  num hand;
  num disabled;
  String toName;

  EquityModel({this.name, this.profits, this.hand, this.disabled, this.toName});

  EquityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].split('_').join('/').toUpperCase();
    profits = json['profits'];
    hand = json['hand'];
    disabled = json['disabled'];
    toName = json['to_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profits'] = this.profits;
    data['hand'] = this.hand;
    data['disabled'] = this.disabled;
    data['to_name'] = this.toName;
    return data;
  }
}
