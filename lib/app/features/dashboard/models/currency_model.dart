import 'package:realize_mobile_app/app/features/dashboard/models/account_model.dart';

class Currency {
  String name;
  List<Account> accounts;
  String imagePath;

  Currency({required this.name, required this.accounts, required this.imagePath});
}
