class ContractAssetsModel {
  List<ContractAssets> exAssets;
  num totalWorth;
  double exRate;

  ContractAssetsModel({this.exAssets, this.totalWorth, this.exRate});

  ContractAssetsModel.fromJson(Map<String, dynamic> json) {
    if (json['ex_assets'] != null) {
      exAssets = new List<ContractAssets>();
      json['ex_assets'].forEach((v) {
        exAssets.add(new ContractAssets.fromJson(v));
      });
    }
    totalWorth = json['total_worth'];
    exRate = json['ex_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exAssets != null) {
      data['ex_assets'] = this.exAssets.map((v) => v.toJson()).toList();
    }
    data['total_worth'] = this.totalWorth;
    data['ex_rate'] = this.exRate;
    return data;
  }
}

class ContractAssets {
  String coinName;
  Object available;
  Object disabled;
  Object equities;

  ContractAssets({this.coinName, this.available, this.disabled, this.equities});

  ContractAssets.fromJson(Map<String, dynamic> json) {
    coinName = json['coin_name'].toUpperCase();
    available = json['available'];
    disabled = json['disabled'];
    equities = json['equities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin_name'] = this.coinName;
    data['available'] = this.available;
    data['disabled'] = this.disabled;
    data['equities'] = this.equities;
    return data;
  }
}
