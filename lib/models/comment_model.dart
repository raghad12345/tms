class Comment {
  int? id;
  String? body;
  int? userId;
  int? taskId;
  String? createdAt;
  String? updatedAt;

  Comment(
      {this.id,
        this.body,
        this.userId,
        this.taskId,
        this.createdAt,
        this.updatedAt});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    userId = json['user_id'];
    taskId = json['task_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['user_id'] = this.userId;
    data['task_id'] = this.taskId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
