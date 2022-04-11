import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactsList extends StatelessWidget {

  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    //contacts.add(Contact(0, 'jheimison', 3000));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          )
              .then(
                (newContact) => debugPrint(newContact.toString()),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
            contact.name),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
