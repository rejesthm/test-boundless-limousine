import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  AppDatabase._();

  static Database? _db;

  static Database get instance {
    final db = _db;
    if (db == null) {
      throw StateError('AppDatabase not initialized. Call init() first.');
    }
    return db;
  }

  static Future<void> init(String dbFileName) async {
    if (_db != null) return;

    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, dbFileName);

    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  static Future<void> close() async {
    final db = _db;
    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
