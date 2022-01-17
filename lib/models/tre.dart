class Tre {
  final String category;
  final String businessName;
  final String contactPerson;
  final String address;
  final String contactNumber;
  final String email;
  final String? website;
  final int id;
  Tre({
    required this.id,
    required this.category,
    required this.businessName,
    required this.contactPerson,
    required this.address,
    required this.contactNumber,
    required this.email,
    this.website,
  });
}

List<Tre> tres = [
  Tre(id: 1, category: "Category 1", businessName: "Green Leaf Hotel", contactPerson: "Ronnel Bedana", contactNumber: "09124717494", email: "ronnel@gmail.com", website: "www.website.com", address: 'Address 1'),
  Tre(id: 2, category: "Category 2", businessName: "Hotel", contactPerson: "Ronnel Bedana", contactNumber: "09124717494", email: "ronnel@gmail.com", website: "www.website.com", address: 'Address 1')
];