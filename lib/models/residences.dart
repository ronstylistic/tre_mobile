class Residences {
  final String id;
  final String country;
  final int male;
  final int female;

  Residences({
    required this.id,
    required this.country,
    required this.male,
    required this.female,
  });

  factory Residences.fromJson(Map<String, dynamic> json) {
    return Residences(
      id: json['id'],
      country: json['country'],
      male: json['male'],
      female: json['female']
    );
  }
}