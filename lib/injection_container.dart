import 'package:adaptor_design_pattern/show%20contacts/data/data_sources/remote_data_source.dart';
import 'package:adaptor_design_pattern/show%20contacts/data/repositories/contacts_repository.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/repositories/contacts_repository.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/use_cases/get_contacts.dart';
import 'package:adaptor_design_pattern/show%20contacts/presentation/bloc/get_contacts_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //features
  sl.registerFactory<GetContactsBloc>(() => GetContactsBloc(getContacts: sl()));
  sl.registerLazySingleton(() => GetContacts(contactsRepository: sl()));
  sl.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  //core

  //external
}
