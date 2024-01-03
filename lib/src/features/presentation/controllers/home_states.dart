// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class HomeStates {}

class InitialHomeStates extends HomeStates {}

class LoadingHomeStates extends HomeStates {}

class LoadedHomeStates extends HomeStates {}

class ErrorHomeStates extends HomeStates {
  final String message;

  ErrorHomeStates(this.message);
}
