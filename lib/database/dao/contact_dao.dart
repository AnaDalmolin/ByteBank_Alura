import 'package:sqflite/sqflite.dart';
import 'package:teste/database/app_database.dart';
import 'package:teste/models/contact.dart';

class ContactDao {

  static const String tableSql = 'CREATE TABLE contacts $_tableName('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER)';
  
  static const String _tableName = 'contacts';

  Future<int> save (Contact contact)async{
  final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
}

Future<List<Contact>> findAll() async{
  final Database db = await createDatabase();

  final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
        final Contact contact = Contact(row['id'], row['name'], row['account_number']);
        contacts.add(contact);
      }
      return contacts;
}
}

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }