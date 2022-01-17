class NonPhilippinesResident {
  final String country;
  final int count;
  final int id;

  NonPhilippinesResident({
    required this.id,
    required this.country,
    required this.count,
  });
}

List<NonPhilippinesResident> nonPhResItem = [
  NonPhilippinesResident(id: 1, country: "Category 1", count: 0),
  NonPhilippinesResident(id: 2, country: "Category 2", count: 0)
];