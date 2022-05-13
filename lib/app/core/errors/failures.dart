import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InvalidLoginFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NetworkInfoFailure extends Failure {
  @override
  List<Object> get props => [];
}

class KeyNotFoundFailure extends Failure {
  @override
  List<Object> get props => [];
}

class StorageFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ClearStorageFailure extends Failure {
  @override
  List<Object> get props => [];
}
