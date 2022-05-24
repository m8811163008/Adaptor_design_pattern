import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

//failures usually mapped on exceptions
class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
