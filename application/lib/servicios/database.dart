import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'calculator.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          email TEXT,
          password TEXT,
          profile_picture TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE operations (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          operation_type TEXT,
          expression TEXT,
          result TEXT,
          timestamp TEXT,
          FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Implementar cambios necesarios para futuras versiones
    }
  }

  Future<void> insertTestData() async {
    var db = await database;
    await db.insert('users', {
      'username': 'testuser',
      'email': 'test@example.com',
      'password': 'password123',
      'profile_picture': ''
    });
    await db.insert('operations', {
      'user_id': 1,
      'operation_type': 'simple',
      'expression': '2 + 2',
      'result': '4',
      'timestamp': DateTime.now().toString()
    });
  }

  Future<void> testDatabase() async {
    var db = await database;
    print('Base de datos inicializada: $db');

    // Insertar datos de prueba
    await insertTestData();

    // Leer datos de prueba
    var result = await db.query('users');
    print('Datos de prueba insertados en users: $result');

    result = await db.query('operations');
    print('Datos de prueba insertados en operations: $result');
  }

  Future<bool> authenticateUser(String username, String password) async {
    var db = await database;
    var result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<void> registerUser(String username, String email, String password,
      String profilePicture) async {
    var db = await database;
    await db.insert('users', {
      'username': username,
      'email': email,
      'password': password,
      'profile_picture': profilePicture
    });
  }

  Future<void> saveOperation(int userId, String operationType,
      String expression, String result) async {
    var db = await database;
    await db.insert('operations', {
      'user_id': userId,
      'operation_type': operationType,
      'expression': expression,
      'result': result,
      'timestamp': DateTime.now().toString()
    });
  }

  Future<List<Map<String, dynamic>>> getOperations(int userId) async {
    var db = await database;
    return await db.query(
      'operations',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'timestamp DESC',
    );
  }
}
