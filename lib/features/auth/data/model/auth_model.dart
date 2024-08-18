class AuthModel {
  String? name;
  String? email;
  String? password;

  AuthModel({this.name, this.email, this.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    // من الأفضل تجنب إرسال كلمة المرور إن لم يكن ضرورياً
    return data;
  }
}
