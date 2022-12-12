class UserModel {
  int? status;
  String? message;
  Result? result;

  UserModel({this.status, this.message, this.result});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? role;
  String? email;

  Result({this.role, this.email});

  Result.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = role;
    data['email'] = email;
    return data;
  }
}
