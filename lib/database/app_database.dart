import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 9,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}


Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
        final Contact contact = Contact(
          row['id'],
          row['name'],
          row['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;

}

//Modelo Antigo Refatorado para async await

// Future<Database> createDatabase() {
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'bytebank.db');
//     return openDatabase(
//       path,
//       onCreate: (db, version) {
//         db.execute('CREATE TABLE contacts('
//             'id INTEGER PRIMARY KEY, '
//             'name TEXT, '
//             'account_number INTEGER)');
//       },
//       version: 9,
//       onDowngrade: onDatabaseDowngradeDelete,
//     );
//   });
// }


// Future<int> save(Contact contact) {
//   return getDatabase().then((db) {
//     final Map<String, dynamic> contactMap = Map();
//     //contactMap['id'] = contact.id;
//     contactMap['name'] = contact.name;
//     contactMap['account_number'] = contact.accountNumber;
//     return db.insert('contacts', contactMap);
//   });
// }

// Future<List<Contact>> findAll() {
//   return getDatabase().then((db) {
//     return db.query('contacts').then((maps) {
//       final List<Contact> contacts = [];
//       for (Map<String, dynamic> map in maps) {
//         final Contact contact = Contact(
//           map['id'],
//           map['name'],
//           map['account_number'],
//         );
//         contacts.add(contact);
//       }
//       return contacts;
//     });
//   });
// }
