class MessageModel {
  int? id;
  String? message;
  String? createdAt;
  bool? isFile;
  String? file;
  String? type;

  MessageModel(
      {this.id,
        this.message,
        this.createdAt,
        this.isFile,
        this.file,
        this.type});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    createdAt = json['created_at'];
    isFile = json['is_file'];
    file = json['file'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['is_file'] = isFile;
    data['file'] = file;
    data['type'] = type;
    return data;
  }
}
