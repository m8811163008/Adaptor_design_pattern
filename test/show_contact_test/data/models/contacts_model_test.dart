import 'dart:convert';

import 'package:adaptor_design_pattern/show%20contacts/data/models/contacts_model.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tContactsModelJson = ContactsModel(contacts: [
    ContactModel(
        fullName: 'John Doe (JSON)',
        email: 'johndoe@json.com',
        favourite: true),
    ContactModel(
        fullName: 'Ema Doe (JSON)',
        email: 'emandoe@json.com',
        favourite: false),
    ContactModel(
        fullName: 'Micheal Roe (JSON)',
        email: 'michro@json.com',
        favourite: false),
  ]);
  final tContactsModelXml = ContactsModel(contacts: [
    ContactModel(
        fullName: 'John doe(XML)', email: 'johndow@xml.com', favourite: false),
    ContactModel(
        fullName: 'Ema Doe(XML)', email: 'emmadow@xml.com', favourite: true),
    ContactModel(
        fullName: 'Micheal roe(XML)',
        email: 'michrow@xml.com',
        favourite: true),
  ]);

  test(
    'should be a subclass of Contact entity',
    () async {
      // assert
      expect(tContactsModelJson.contacts[0], isA<Contact>());
    },
  );
  test('should return a valid model when get json data', () async {
    //arrange
    final jsonString = fixture('contacts.json');
    final Map<String, dynamic> decodeJson = jsonDecode(jsonString);
    //act
    final ContactsModel result = ContactsModel.fromJson(decodeJson);

    //assert
    for (int index = 0; index < tContactsModelJson.contacts.length; index++) {
      expect(tContactsModelJson.contacts[index], result.contacts[index]);
    }
  });
  test('should return a valid model when get xml data', () async {
    //arrange
    final jsonString = fixture('contacts.xml');
    final XmlDocument parsedXml = XmlDocument.parse(jsonString);
    //act
    final ContactsModel result = ContactsModel.fromXml(parsedXml);
    for (int index = 0; index < tContactsModelXml.contacts.length; index++) {
      expect(tContactsModelXml.contacts[index], result.contacts[index]);
    }
    //assert
  });
}
