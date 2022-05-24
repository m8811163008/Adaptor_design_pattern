import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String fullName;
  final String email;
  final bool favourite;

  const Contact(
      {required this.fullName, required this.email, required this.favourite});

  @override
  List<Object?> get props => [fullName, email, favourite];
}
