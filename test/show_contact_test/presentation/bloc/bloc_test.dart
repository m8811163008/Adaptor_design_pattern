import 'dart:convert';

import 'package:adaptor_design_pattern/core/errors/failure.dart';
import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/models/contacts_model.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/use_cases/get_contacts.dart';
import 'package:adaptor_design_pattern/show%20contacts/presentation/bloc/get_contacts_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xml/xml.dart';

import '../../../fixtures/fixture_reader.dart';
import 'bloc_test.mocks.dart';

@GenerateMocks([GetContacts])
void main() {
  late GetContactsBloc sut;
  late MockGetContacts mockGetContacts;

  final List<Contact> tContactsJson =
      ContactsModel.fromJson(jsonDecode(fixture('contacts.json'))).contacts;
  final List<Contact> tContactsXml =
      ContactsModel.fromXml(XmlDocument.parse(fixture('contacts.xml')))
          .contacts;
  setUp(() {
    mockGetContacts = MockGetContacts();
    sut = GetContactsBloc(getContacts: mockGetContacts);
  });
  test('initial state should be Empty', () {
    expect(sut.state, Empty());
  });
  //create group test for every event
  group('GetContactsEventImp', () {
    blocTest(
        'if event is GetContactsEventImp with CallType.json should return List<Contact> if server call successful',
        build: () => sut,
        setUp: () {
          when(mockGetContacts.call(param: anyNamed('param')))
              .thenAnswer((_) async => Right(tContactsJson));
        },
        act: (GetContactsBloc bloc) =>
            bloc.add(GetContactsEventImp(CallType.json)),
        expect: () => [Loading(), Loaded(contacts: tContactsJson)],
        verify: (GetContactsBloc bloc) =>
            bloc.getContacts.call(param: CallType.json));
    blocTest(
      'if event is GetContactsEventImp with CallType.xml should return List<Contact> if server call successful',
      build: () => sut,
      setUp: () {
        when(mockGetContacts.call(param: anyNamed('param')))
            .thenAnswer((_) async => Right(tContactsXml));
      },
      act: (GetContactsBloc bloc) =>
          bloc.add(GetContactsEventImp(CallType.xml)),
      expect: () => [Loading(), Loaded(contacts: tContactsXml)],
      verify: (GetContactsBloc bloc) =>
          bloc.getContacts.call(param: CallType.xml),
    );
    blocTest(
      'if event is GetContactsEventImp with CallType.xml should emit Error cause server call is unsuccessful',
      build: () => sut,
      setUp: () {
        when(mockGetContacts.call(param: anyNamed('param')))
            .thenAnswer((_) async => Left(ServerFailure()));
      },
      act: (GetContactsBloc bloc) =>
          bloc.add(const GetContactsEventImp(CallType.xml)),
      expect: () => [Loading(), const Error(message: serverFailureString)],
      verify: (GetContactsBloc bloc) =>
          bloc.getContacts.call(param: CallType.xml),
    );
    blocTest(
        'if event is GetContactsEventImp with CallType.json should emit Error cause server call is unsuccessful',
        build: () => sut,
        setUp: () {
          when(mockGetContacts.call(param: anyNamed('param')))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        act: (GetContactsBloc bloc) =>
            bloc.add(GetContactsEventImp(CallType.json)),
        expect: () => [Loading(), const Error(message: serverFailureString)],
        verify: (GetContactsBloc bloc) =>
            bloc.getContacts.call(param: CallType.json));
  });
}
