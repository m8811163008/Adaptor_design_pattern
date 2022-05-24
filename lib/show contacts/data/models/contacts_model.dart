import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:xml/xml.dart';

class ContactsModel {
  List<Contact> contacts = [];

  ContactsModel({required this.contacts});

  ContactsModel.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      json['contacts'].forEach((v) {
        contacts.add(ContactModel.fromJson(v));
      });
    }
  }

  ContactsModel.fromXml(XmlDocument xmlDocument) {
    contacts = [];
    for (XmlElement xmlElement in xmlDocument.findAllElements('contact')) {
      contacts.add(ContactModel.fromXml(xmlElement));
    }
  }

  @override
  List<Object?> get props => [contacts];
}

class ContactModel extends Contact {
  ContactModel(
      {required String fullName,
      required String email,
      required bool favourite})
      : super(fullName: fullName, email: email, favourite: favourite);

  ContactModel.fromJson(Map<String, dynamic> json)
      : super(
          fullName: json['fullName'],
          email: json['email'],
          favourite: json['favourite'],
        );

  ContactModel.fromXml(XmlElement xmlElement)
      : super(
          fullName: xmlElement.findElements('fullName').single.text.trim(),
          email: xmlElement.findElements('email').single.text.trim(),
          favourite: xmlElement
                  .findElements('favourite')
                  .single
                  .text
                  .toLowerCase()
                  .trim() ==
              'true',
        );
}
