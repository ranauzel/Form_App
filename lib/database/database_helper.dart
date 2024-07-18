import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    // Create users table
    const userTable = '''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL
    );
    ''';
    await db.execute(userTable);

    // Create budgets table
    const budgetEntry = '''
    CREATE TABLE budgets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      category TEXT,
      allocation TEXT,
      realization TEXT,
      rate TEXT
    );
    ''';
    await db.execute(budgetEntry);

    // Create vehicleUsage table
    const vehicleUsage = '''
    CREATE TABLE vehicleUsage (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      resmiTasit INTEGER,
      kiralikTasit INTEGER,
      toplamTasitSayisi INTEGER,
      yol INTEGER,
      akaryakit INTEGER,
      tutar INTEGER,
      aciklama TEXT,
      elektrikKwh INTEGER,
      isinmaM3 INTEGER,
      suM3 INTEGER,
      elektrikTl INTEGER,
      gazTl INTEGER,
      suTl INTEGER,
      komurTon INTEGER,
      fuelOilTon INTEGER,
      lngTon INTEGER,
      motorinLt INTEGER,
      lpgKg INTEGER,
      komurTl INTEGER,
      fuelOilTl INTEGER,
      lngTl INTEGER,
      motorinTl INTEGER,
      lpgTl INTEGER,
      yakitAciklama TEXT,
      tasra1 INTEGER,
      tasra2 INTEGER,
      tlsu INTEGER,
      tlelektrik INTEGER,
      tldogalgaz INTEGER,
      tllpg INTEGER,
      tllng INTEGER,
      tlmotorin INTEGER,
      tlfueloil INTEGER,
      tlkomur INTEGER,
      giyimyardim INTEGER
    );
    ''';
    await db.execute(vehicleUsage);
  }

  Future<int> insertUser(String username, String password) async {
    final db = await instance.database;
    final data = {'username': username, 'password': password};
    return await db.insert('users', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertBudgetEntry(int userId, String category, String allocation,
      String realization, String rate) async {
    final db = await instance.database;
    final data = {
      'userId': userId,
      'category': category,
      'allocation': allocation,
      'realization': realization,
      'rate': rate,
    };
    return await db.insert('budgets', data);
  }

  Future<int> insertVehicleUsageEntry(
      int userId,
      int resmiTasit,
      int kiralikTasit,
      int toplamTasitSayisi,
      int yol,
      int akaryakit,
      int tutar,
      String aciklama,
      int elektrikKwh,
      int isinmaM3,
      int suM3,
      int elektrikTl,
      int gazTl,
      int suTl,
      int komurTon,
      int fuelOilTon,
      int lngTon,
      int motorinLt,
      int lpgKg,
      int komurTl,
      int fuelOilTl,
      int lngTl,
      int motorinTl,
      int lpgTl,
      String yakitAciklama,
      int tasra1,
      int tasra2,
      int tlsu,
      int tlelektrik,
      int tldogalgaz,
      int tllpg,
      int tllng,
      int tlmotorin,
      int tlfueloil,
      int tlkomur,
      int giyimyardim) async {
    final db = await instance.database;
    final data = {
      'userId': userId,
      'resmiTasit': resmiTasit,
      'kiralikTasit': kiralikTasit,
      'toplamTasitSayisi': toplamTasitSayisi,
      'yol': yol,
      'akaryakit': akaryakit,
      'tutar': tutar,
      'aciklama': aciklama,
      'elektrikKwh': elektrikKwh,
      'isinmaM3': isinmaM3,
      'suM3': suM3,
      'elektrikTl': elektrikTl,
      'gazTl': gazTl,
      'suTl': suTl,
      'komurTon': komurTon,
      'fuelOilTon': fuelOilTon,
      'lngTon': lngTon,
      'motorinLt': motorinLt,
      'lpgKg': lpgKg,
      'komurTl': komurTl,
      'fuelOilTl': fuelOilTl,
      'lngTl': lngTl,
      'motorinTl': motorinTl,
      'lpgTl': lpgTl,
      'yakitAciklama': yakitAciklama,
      'tasra1': tasra1,
      'tasra2': tasra2,
      'tlsu': tlsu,
      'tlelektrik': tlelektrik,
      'tldogalgaz': tldogalgaz,
      'tllpg': tllpg,
      'tllng': tllng,
      'tlmotorin': tlmotorin,
      'tlfueloil': tlfueloil,
      'tlkomur': tlkomur,
      'giyimyardim': giyimyardim,
    };
    return await db.insert('vehicleUsage', data);
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      columns: ['id', 'username', 'password'],
      where: 'username = ?',
      whereArgs: [username],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getBudgetEntries(int userId) async {
    final db = await instance.database;
    return await db.query(
      'budgets',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }

  Future<List<Map<String, dynamic>>> getVehicleUsageEntries(int userId) async {
    final db = await instance.database;
    return await db.query(
      'vehicleUsage',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }
}
