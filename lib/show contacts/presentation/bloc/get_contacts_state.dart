part of 'get_contacts_bloc.dart';

abstract class GetContactsState extends Equatable {
  const GetContactsState();
}

//initial state
class Empty extends GetContactsState {
  @override
  List<Object> get props => [];
}

class Loading extends GetContactsState {
  @override
  List<Object?> get props => [];
}

class Loaded extends GetContactsState {
  final List<Contact> contacts;

  const Loaded({required this.contacts});

  @override
  List<Object?> get props => [contacts];
}

class Error extends GetContactsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
