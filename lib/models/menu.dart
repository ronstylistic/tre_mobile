class Menu {
  final String text;
  final String? image;
  final int id;
  Menu({
    required this.id,
    required this.text,
    this.image
  });
}

List<Menu> menus = [
  Menu(id: 1, text: "My Account", image: "assets/icons/account.svg"),
  Menu(id: 2, text: "User Account", image: "assets/icons/users.svg"),
  Menu(id: 3, text: "Manage TREs", image: "assets/icons/manage.svg"),
  Menu(id: 4, text: "Reports", image: "assets/icons/reports.svg"),
  Menu(id: 5, text: "Manage Database", image: "assets/icons/manage.svg"),
  Menu(id: 6, text: "Help", image: "assets/icons/account.svg"),
];

List<Menu> userMenus = [
  Menu(id: 1, text: "My Account", image: "assets/icons/account.svg"),
  Menu(id: 2, text: "Overnight Guests"),
  Menu(id: 3, text: "Daytime Tourist"),
  Menu(id: 4, text: "MICE"),
  Menu(id: 5, text: "Inbound"),
  Menu(id: 6, text: "Tour Operators"),
];