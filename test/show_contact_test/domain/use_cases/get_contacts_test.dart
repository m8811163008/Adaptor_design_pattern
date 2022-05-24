import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/repositories/contacts_repository.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/use_cases/get_contacts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_contacts_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  late MockContactsRepository mockContactsRepository;
  late GetContacts sut;
  final tContacts = [
    const Contact(fullName: 'test', email: 'test@test.com', favourite: true),
    const Contact(fullName: 'test2', email: 'test2@test.com', favourite: false)
  ];
  setUp(() {
    mockContactsRepository = MockContactsRepository();
    sut = GetContacts(contactsRepository: mockContactsRepository);
  });
  test(
      'When call GetContacts with CallType.json it should return a list of contacts',
      () async {
    //arrange
    when(mockContactsRepository.getContacts(callType: anyNamed('callType')))
        .thenAnswer((_) async => Right(tContacts));
    //act
    final result = await sut.call(param: CallType.json);
    //verify
    verify(mockContactsRepository.getContacts(callType: CallType.json));
    //assert
    expect(result, Right(tContacts));
  });
  test(
      'When call GetContacts with CallType.xml it should return a list of contacts',
      () async {
    //arrange
    when(mockContactsRepository.getContacts(callType: anyNamed('callType')))
        .thenAnswer((_) async => Right(tContacts));
    //act
    final result = await sut.call(param: CallType.xml);
    //verify
    verify(mockContactsRepository.getContacts(callType: CallType.xml));
    //assert
    expect(result, Right(tContacts));
  });
}
