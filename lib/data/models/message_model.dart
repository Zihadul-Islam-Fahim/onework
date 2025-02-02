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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['type'] = type;
    return data;
  }
}
