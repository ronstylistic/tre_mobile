class TreModel {
  String? category;
  String? businessName;
  String? contactPerson;
  String? address;
  String? contactNumber;
  String? email;
  String? website;
  String? otherInfo;
  String? id;
  TreModel({
    this.id,
    this.category,
    this.businessName,
    this.contactPerson,
    this.address,
    this.contactNumber,
    this.email,
    this.website,
    this.otherInfo
  });

  Map<String, dynamic> toJson() => {
    'category': category,
    'businessName': businessName,
    'contactPerson': contactPerson,
    'address': address,
    'contactNumber': contactNumber,
    'email': email,
    'website': website,
    'otherInfo': otherInfo
  };

  factory TreModel.fromJson(Map<String, dynamic> json) => TreModel(
      id: json['id'],
      category: json['category'],
      businessName: json['businessName'],
      contactPerson: json['contactPerson'],
      address: "",
      contactNumber: json['contactNumber'],
      email: json['email'],
      website: json['website'],
      otherInfo: json['otherInfo']
  );
}