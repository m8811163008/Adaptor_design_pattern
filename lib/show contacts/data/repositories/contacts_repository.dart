import 'package:adaptor_design_pattern/core/errors/exceptions.dart';
import 'package:adaptor_design_pattern/core/errors/failure.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/data_sources/remote_data_source.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/entities/contact.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../models/contacts_model.dart';

///Adaptor class
class ContactsRepositoryImpl implements ContactsRepository {
  RemoteDataSource remoteDataSource;

  ContactsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Contact>>> getContacts(
      {required CallType callType}) async {
    try {
      final ContactsModel contactsModel = callType == CallType.json
          ? await remoteDataSource.getContactsJson()
          : await remoteDataSource.getContactsXml();
      return Right(contactsModel.contacts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
