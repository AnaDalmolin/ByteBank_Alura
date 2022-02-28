import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/database/dao/contact_dao.dart';

Future<Database> createDatabase() async{
  final String path = join(await getDatabasesPath(), 'bytebank.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute(ContactDao.tableSql);
    }, version: 1, 
    // onDowngrade: onDatabaseDowngradeDelete toda vez que precisar limpar o banco de dados, é só subir uma versão
    // e depois desser a mesma para limpar o banco de dados
    );
  
}
