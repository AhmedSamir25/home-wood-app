class AuthModel {
  String? name;
  String? email;
  String? password;
  String? msg;
  String? statusText;

  AuthModel({this.name, this.email, this.password, this.msg,this.statusText});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      msg :  json['msg'] as String?,
      statusText: json['statusText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
