import 'package:adaptor_design_pattern/core/errors/failure.dart';
import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<Contact>>> getContacts(
      {required CallType callType});
}
