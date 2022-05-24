import 'package:adaptor_design_pattern/core/usecases/usecase.dart';
import 'package:adaptor_design_pattern/show%20contacts/domain/use_cases/get_contacts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/contact.dart';

part 'get_contacts_event.dart';
part 'get_contacts_state.dart';

const String serverFailureString = 'Server Error';

class GetContactsBloc extends Bloc<GetContactsEvent, GetContactsState> {
  //get contacts use case
  GetContacts getContacts;

  GetContactsBloc({required this.getContacts}) : super(Empty()) {
    on<GetContactsEvent>((event, emit) async {
      Future<void> getContactsCall(CallType callType) async {
        emit(Loading());
        final result = await getContacts.call(param: callType);
        result.fold((failure) {
          emit(const Error(message: serverFailureString));
        }, (listOfContacts) {
          emit(Loaded(contacts: listOfContacts));
        });
      }

      if (event is GetContactsEventImp) {
        await getContactsCall(event.callType);
      }
    });
  }
}
