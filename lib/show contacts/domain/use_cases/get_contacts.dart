import 'package:adaptor_design_pattern/core/errors/failure.dart';
import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class GetContacts implements UseCase<List<Contact>, CallType> {
  ContactsRepository contactsRepository;

  GetContacts({required this.contactsRepository});

  @override
  Future<Either<Failure, List<Contact>>> call({required CallType param}) {
    return contactsRepository.getContacts(callType: param);
  }
}
