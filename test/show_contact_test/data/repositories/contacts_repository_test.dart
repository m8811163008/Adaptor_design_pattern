import 'dart:convert';

import 'package:adaptor_design_pattern/core/errors/exceptions.dart';
import 'package:adaptor_design_pattern/core/errors/failure.dart';
import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/data_sources/remote_data_source.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/models/contacts_model.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'contacts_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late ContactsRepositoryImpl sut;
  final tContactsModel =
      ContactsModel.fromJson(jsonDecode(fixture('contacts.json')));
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    sut = ContactsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });
  group('getContacts', () {
    test(
        'should return List<Contact> when call the remote data source xml is successful',
        () async {
      //arrange
      when(mockRemoteDataSource.getContactsXml())
          .thenAnswer((_) async => tContactsModel);
      //act
      final result = await sut.getContacts(callType: CallType.xml);

      //assert
      expect(result, Right(tContactsModel.contacts));
    });
    test(
        'should return List<Contact> when call the remote data source json is successful',
        () async {
      //arrange
      when(mockRemoteDataSource.getContactsJson())
          .thenAnswer((_) async => tContactsModel);
      //act
      final result = await sut.getContacts(callType: CallType.json);

      //assert
      expect(result, Right(tContactsModel.contacts));
    });
    test(
        'should return ServerFailure when call the remote data source xml is unsuccessful',
        () async {
      //arrange
      when(mockRemoteDataSource.getContactsXml()).thenThrow(ServerException());
      //act
      final result = await sut.getContacts(callType: CallType.xml);

      //assert
      expect(result, Left(ServerFailure()));
    });
    test(
        'should return ServerFailure when call the remote data source json is unsuccessful',
        () async {
      //arrange
      when(mockRemoteDataSource.getContactsJson()).thenThrow(ServerException());
      //act
      final result = await sut.getContacts(callType: CallType.json);

      //assert
      expect(result, Left(ServerFailure()));
    });
  });
}
