import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sql.dart';

class DatabaseHelper {
  static Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'accounts.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE accounts(id INTEGER , username TEXT PRIMARY KEY, password TEXT)");
      },
    );
  }

  static Future<void> insertToDatabase(
      String table, Map<String, Object> content) async {
    final db = await DatabaseHelper.initDatabase();
    db.insert(table, content, conflictAlgorithm: ConflictAlgorithm.rollback);
    print('inserted');
  }

  static Future<List<Map<String, Object>>> getDatabaseContent(
      String table) async {
    final db = await DatabaseHelper.initDatabase();
    return db.query(table);
  }

  static Future<void> deleteObject(String username) async {
    final db = await DatabaseHelper.initDatabase();
    db.rawDelete('DELETE FROM accounts WHERE username = ?', [username]);
    print('done!!!');
  }

  static Future<void> changePass(String oldPass, String newPassword) async {
    final db = await DatabaseHelper.initDatabase();

    db.rawUpdate(
        'UPDATE accounts SET password = ? WHERE username =?', [newPassword, oldPass]);
    // await  db.update('accounts',{'password':newPassword},where: oldPass, );
    print('password changed hopefully:)))');
  }
}

