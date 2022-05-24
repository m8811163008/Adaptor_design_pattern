part of 'get_contacts_bloc.dart';

abstract class GetContactsEvent extends Equatable {
  const GetContactsEvent();
}

class GetContactsEventImp extends GetContactsEvent {
  final CallType callType;

  const GetContactsEventImp(this.callType);

  @override
  List<Object?> get props => [callType];
}
