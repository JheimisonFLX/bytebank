import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('jheimison'),
              subtitle: Text(
                '1000',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
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
