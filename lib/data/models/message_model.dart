class MessageModel {
  int? id;
  String? message;
  String? createdAt;
  String? type;

  MessageModel({this.id, this.message, this.createdAt, this.type});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    createdAt = json['created_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}
