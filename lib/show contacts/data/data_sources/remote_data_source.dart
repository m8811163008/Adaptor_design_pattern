import 'dart:convert';

import 'package:adaptor_design_pattern/show%20contacts/data/models/contacts_model.dart';
import 'package:xml/xml.dart';

import '../../../core/errors/exceptions.dart';

abstract class RemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<ContactsModel> getContactsXml();

  Future<ContactsModel> getContactsJson();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<ContactsModel> getContactsJson() {
    const String json = '''
    {
  "contacts": [
    {
      "fullName" : "John Doe (JSON)",
      "email" : "johndoe@json.com",
      "favourite" : true
    },
    {
      "fullName" : "Ema Doe (JSON)",
      "email" : "emandoe@json.com",
      "favourite" : false
    },
    {
      "fullName" : "Micheal Roe (JSON)",
      "email" : "michro@json.com",
      "favourite" : false
    }
  ]
}
    ''';
    try {
      return Future.delayed(const Duration(seconds: 2))
          .then((_) => ContactsModel.fromJson(jsonDecode(json)));
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<ContactsModel> getContactsXml() {
    const String xml = '''
<?xml version="1.0" encoding="UTF-8" ?>
<contacts>
    <contact>
        <fullName>
            John doe(XML)
        </fullName>
        <email>
            johndow@xml.com
        </email>
        <favourite>
            false
        </favourite>
    </contact>
    <contact>
        <fullName>
            Ema Doe(XML)
        </fullName>
        <email>
            emmadow@xml.com
        </email>
        <favourite>
            true
        </favourite>
    </contact>
    <contact>
        <fullName>
            Micheal roe(XML)
        </fullName>
        <email>
            michrow@xml.com
        </email>
        <favourite>
            true
        </favourite>
    </contact>
</contacts>
    ''';
    try {
      return Future.delayed(const Duration(seconds: 2))
          .then((_) => ContactsModel.fromXml(XmlDocument.parse(xml)));
    } on Exception {
      throw ServerException();
    }
  }
}
