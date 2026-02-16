import 'package:sembast/sembast.dart';

abstract class DatabaseStores {
  DatabaseStores._();

  static final StoreRef<String, Map<String, dynamic>> phoneContacts =
      stringMapStoreFactory.store('phone_contacts');
}
