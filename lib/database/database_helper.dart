import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_info/database/student_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;
  DatabaseHelper._instance();
  String studentTable = 'student_table';
  String colId = 'id';
  String colFirstName = 'first_name';
  String colLastName = 'last_name';
  String colEmail = 'email';
  String colPhone = 'phone';
  String colDepartment = 'department';
  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'school_of_compuing.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      '''
 CREATE TABLE $studentTable(
 $colId INTEGER PRIMARY KEY AUTOINCREMENT,
 $colFirstName TEXT,
 $colLastName TEXT,
 $colEmail TEXT,
 $colPhone TEXT,
 $colDepartment TEXT
 )
 ''',
    );
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    Database db = await this.db;
    return await db.insert(studentTable, student);
  }

  Future<List<Student>> getStudentList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(studentTable);
    return List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
  }

  Future<int> updateStudent(Map<String, dynamic> student) async {
    Database db = await this.db;
    return await db.update(
      studentTable,
      student,
      where: '$colId = ?',
      whereArgs: [student[colId]],
    );
  }

  Future<int> deleteStudent(int id) async {
    Database db = await this.db;
    return await db.delete(
      studentTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Student>> getStudentsByDepartment(String department) async {
    Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(
      studentTable,
      where: '$colDepartment = ?',
      whereArgs: [department],
    );
    return List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
  }

  Future<List<Student>> getstudentByDepartment(String department) async {
    Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query(
      studentTable,
      where: '$colDepartment = ?',
      whereArgs: [department],
    );
    return List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
  }
}
