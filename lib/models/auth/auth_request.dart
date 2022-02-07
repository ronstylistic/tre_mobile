class AuthRequestModel {
  String? email;
  String? password;

  AuthRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };
}