class User {
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final int id;
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email
  });
}

List<User> users = [
  User(id: 1, firstname: "Ronnel", lastname: "Bedana", username: "user1", email: "ronnel@gmail.com"),
  User(id: 2, firstname: "Kenetox", lastname: "Sibayan", username: "user2", email: "ronnel2@gmail.com")
];