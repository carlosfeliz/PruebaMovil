
import 'package:prueva_movil_clientes_app/models/cliente.dart';
import 'package:prueva_movil_clientes_app/models/direccion.dart';
import 'package:prueva_movil_clientes_app/models/empresa.dart';
import 'package:prueva_movil_clientes_app/statics/arguments.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static String tblEmpresa = "empresas";
  static String tblCliente = "clientes";
  static String tblDireccion = "direccion";
  static Future<Database> _openDB() async {

    return openDatabase(join(await getDatabasesPath(),'dbpruebatecnica2.db'),
        onCreate: (db, version) {
      db.execute(
            "CREATE TABLE $tblEmpresa (empresaId INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT);"
          );
      db.execute(
            "CREATE TABLE $tblDireccion (direccionId INTEGER PRIMARY KEY, direccion TEXT, clienteId INTEGER );"
        );
      db.execute(
            "CREATE TABLE $tblCliente (clienteId INTEGER PRIMARY KEY, nombre TEXT, apellido TEXT, empresaId INTEGER);",
      );

        }, version: 1);
  }

  static Future<int> insert(EmpresaModel animal) async {
    Database database = await _openDB();

    return database.insert(tblEmpresa, animal.toMap());
  }
  static Future<int> insertCliente(ClienteModel cliente) async {
    Database database = await _openDB();

    return database.insert(tblCliente, cliente.toMap());
  }

  static Future<int> insertDireccion(DireccionModel direccion) async {
    Database database = await _openDB();

    return database.insert(tblDireccion, direccion.toMap());
  }

  static Future<int> delete(EmpresaModel animal) async {
    Database database = await _openDB();
    return database.delete(tblEmpresa, where: "empresaId = ?", whereArgs: [animal.empresaId]);
  }

  static Future<int> deleteCliente(ClienteModel cliente) async {
    Database database = await _openDB();
    return database.delete(tblCliente, where: "clienteId = ?", whereArgs: [cliente.clienteId]);
  }

  static Future<int> deleteDireccion(DireccionModel direccion) async {
    Database database = await _openDB();
    return database.delete(tblDireccion, where: "direccionId = ?", whereArgs: [direccion.direccionId]);
  }


  static Future<int> update(EmpresaModel animal) async {
    Database database = await _openDB();
    return database.update(tblEmpresa, animal.toMap(), where: "empresaId = ?", whereArgs: [animal.empresaId]);
  }

  static Future<int> updateCliente(ClienteModel cliente) async {
    Database database = await _openDB();
    return database.update(tblCliente, cliente.toMap(), where: "clienteId = ?", whereArgs: [cliente.clienteId]);
  }

  static Future<int> updateDireccion(DireccionModel direccion) async {
    Database database = await _openDB();
    return database.update(tblDireccion, direccion.toMap(), where: "direccionId = ?", whereArgs: [direccion.direccionId]);
  }

  static Future<List<EmpresaModel>> animales() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> animalesMap = await database.query(tblEmpresa);

    return List.generate(animalesMap.length,
            (i) => EmpresaModel(
            empresaId: animalesMap[i]['empresaId'],
            nombre: animalesMap[i]['nombre'],
            direccion: animalesMap[i]['direccion']
        ));
  }

  static Future<List<ClienteModel>> clientes() async {
    Database database = await _openDB();
    int idPadre = SettingsApp.empresasSelected.empresaId!;
    final List<Map<String, dynamic>> clientesMap = await database.query(
        tblCliente
        ,where: "empresaId =?"
        ,whereArgs: [idPadre]
    );

    return List.generate(clientesMap.length,
            (i) => ClienteModel(
            clienteId: clientesMap[i]['clienteId'],
            nombre: clientesMap[i]['nombre'],
            apellido: clientesMap[i]['apellido'],
              empresaId: clientesMap[i]['empresaId'],
        ));
  }

  static Future<List<DireccionModel>> direcciones() async {
    Database database = await _openDB();
    int idPadre = SettingsApp.clienteSelected.clienteId!;
    final List<Map<String, dynamic>> direccionMap = await database.query(
        tblDireccion
        ,where: "clienteId =?"
      ,whereArgs: [idPadre]);

    return List.generate(direccionMap.length,
            (i) => DireccionModel(
          clienteId: direccionMap[i]['clienteId'],
          direccion: direccionMap[i]['direccion'],
          direccionId: direccionMap[i]['direccionId']
        ));
  }

  // CON SENTENCIAS
  static Future<void> insertar2(EmpresaModel animal) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO $tblEmpresa (empresaId, nombre, direccion) VALUES (${animal.empresaId}, ${animal.nombre}, ${animal.direccion})");
  }
  // CON SENTENCIAS
  static Future<void> insertar2Direccion(DireccionModel animal) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO $tblDireccion (clienteId, direccion) VALUES (${animal.clienteId}, ${animal.direccion})");
  }


  // CON SENTENCIAS
  static Future<void> insertar2Cliente(ClienteModel cliente) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO $tblCliente (empresaId, nombre, apellido) VALUES (${cliente.empresaId}, ${cliente.nombre}, ${cliente.apellido})");
  }


}