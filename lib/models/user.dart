class UserModel {
  String? firstname;
  String? lastname;
  String? company;
  String? email;
  String? role;
  String? id;
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.company,
    this.email,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    company: json['company'],
    email: json['email'],
    role: json['role']
  );

  Map<String, dynamic> toJson() => {
    'firstname': firstname,
    'lastname': lastname,
    'company': company,
    'email': email,
    'role': role,
  };
}