import 'package:desafio_tecnico/models/lead_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  static final DBService _instance = DBService._internal();
  static Database? _database;

  factory DBService() {
    return _instance;
  }

  DBService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'car_leads.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE leads (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userName TEXT,
        userEmail TEXT,
        carId INTEGER
      )
    ''');
  }

  Future<void> insertLead(LeadModel lead) async {
    final db = await database;
    await db.insert('leads', lead.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<LeadModel>> getLeads() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('leads');
    return List.generate(maps.length, (i) {
      return LeadModel(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        userEmail: maps[i]['userEmail'],
        carId: maps[i]['carId'],
      );
    });
  }

  Future<void> clearLeads() async {
    final db = await database;
    await db.delete('leads');
  }
}
