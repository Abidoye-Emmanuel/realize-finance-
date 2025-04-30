// Define a model for the account with a name and whether it's selected
class Account {
  String name;
  bool isSelected;
  String imagePath;

  Account(
      {required this.name, this.isSelected = false, required this.imagePath});
}
