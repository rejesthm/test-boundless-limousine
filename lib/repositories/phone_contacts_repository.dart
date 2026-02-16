import 'package:sembast/sembast.dart';

import 'package:test_repo_example/common/models/phone_contact/phone_contact.dart';
import 'package:test_repo_example/database/app_database.dart';
import 'package:test_repo_example/database/database_stores.dart';

class PhoneContactsRepository {
  PhoneContactsRepository({Database? db}) : _db = db ?? AppDatabase.instance;

  final Database _db;
  final _store = DatabaseStores.phoneContacts;

  Future<List<PhoneContact>> loadContacts() async {
    final snapshots = await _store.find(_db);
    return snapshots
        .map((s) => PhoneContact.fromJson(Map<String, dynamic>.from(s.value)))
        .toList();
  }

  Future<PhoneContact?> findByPhone(String phone) async {
    final key = PhoneContact.normalizePhone(phone);
    if (key.isEmpty) return null;

    final snapshot = await _store.record(key).getSnapshot(_db);
    if (snapshot == null) return null;

    return PhoneContact.fromJson(
      Map<String, dynamic>.from(snapshot.value as Map),
    );
  }

  Future<void> saveContact(PhoneContact contact) async {
    final key = PhoneContact.normalizePhone(contact.number);
    if (key.isEmpty) return;

    await _store.record(key).put(_db, contact.toJson());
  }
}
