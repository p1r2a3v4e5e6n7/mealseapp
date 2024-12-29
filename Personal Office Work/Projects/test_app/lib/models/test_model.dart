class TestModel {
  String mail;
  String phone;
  TestModel({required this.mail, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'mail': mail,
      'phone': phone,
    };
  }

  factory TestModel.form(Map<String, dynamic> json) {
    return TestModel(mail: json['mail'] ?? '', phone: json['phone'] ?? '');
  }
}
