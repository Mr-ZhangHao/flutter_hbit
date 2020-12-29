class LoginHistoryModel {
  int id;
  int userId;
  String status;
  String ip;
  String client;
  String createdAt;

  LoginHistoryModel({this.id, this.userId, this.status, this.ip, this.client, this.createdAt});

  LoginHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    ip = json['ip'];
    client = json['client'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['ip'] = this.ip;
    data['client'] = this.client;
    data['created_at'] = this.createdAt;
    return data;
  }
}
