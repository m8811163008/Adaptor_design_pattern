// Mocks generated by Mockito 5.2.0 from annotations
// in adaptor_design_pattern/test/show_contact_test/presentation/bloc/bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:adaptor_design_pattern/core/errors/failure.dart' as _i6;
import 'package:adaptor_design_pattern/core/usecases/usecase.dart' as _i8;
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart'
    as _i7;
import 'package:adaptor_design_pattern/show%20contacts/domain/repositories/contacts_repository.dart'
    as _i2;
import 'package:adaptor_design_pattern/show%20contacts/domain/use_cases/get_contacts.dart'
    as _i4;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeContactsRepository_0 extends _i1.Fake
    implements _i2.ContactsRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetContacts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetContacts extends _i1.Mock implements _i4.GetContacts {
  MockGetContacts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ContactsRepository get contactsRepository =>
      (super.noSuchMethod(Invocation.getter(#contactsRepository),
          returnValue: _FakeContactsRepository_0()) as _i2.ContactsRepository);
  @override
  set contactsRepository(_i2.ContactsRepository? _contactsRepository) => super
      .noSuchMethod(Invocation.setter(#contactsRepository, _contactsRepository),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Contact>>> call(
          {_i8.CallType? param}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#param: param}),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Contact>>>.value(
              _FakeEither_1<_i6.Failure, List<_i7.Contact>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Contact>>>);
}
