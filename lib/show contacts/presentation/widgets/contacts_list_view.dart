import 'package:flutter/material.dart';

import '../../domain/entities/contact.dart';

class ContactsListView extends StatelessWidget {
  const ContactsListView({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final Contact contact = contacts.elementAt(index);
          return ListTile(
            title: Text(contact.fullName),
            subtitle: Text(contact.email),
            trailing: contact.favourite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
          );
        });
  }
}
