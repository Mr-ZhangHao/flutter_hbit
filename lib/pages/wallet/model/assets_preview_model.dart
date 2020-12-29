class AssetPreviewModel {
  String total;
  String totalCny;

  AssetPreviewModel({this.total, this.totalCny});

  AssetPreviewModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalCny = json['total_cny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_cny'] = this.totalCny;
    return data;
  }
}
