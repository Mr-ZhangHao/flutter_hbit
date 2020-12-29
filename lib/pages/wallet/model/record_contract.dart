class RecordContract {
  String type;
  String changeNumber;
  String note;
  String fee;
  String hand;
  String createdAt;

  RecordContract({this.type, this.changeNumber, this.note, this.fee, this.hand, this.createdAt});

  RecordContract.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    changeNumber = json['change_number'];
    note = json['note'];
    fee = json['fee'];
    hand = json['hand'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['change_number'] = this.changeNumber;
    data['note'] = this.note;
    data['fee'] = this.fee;
    data['hand'] = this.hand;
    data['created_at'] = this.createdAt;
    return data;
  }
}
