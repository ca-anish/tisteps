part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class AppLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  @override
  List<Object> get props => [];
}

class UserListLoaded extends UserState {
  final UserResponseModel userList;

  const UserListLoaded(this.userList);

  @override
  List<Object> get props => [];
}

class UserListError extends UserState {
  final String msg;
  final bool? status;

  const UserListError(this.msg, {this.status});

  @override
  List<Object> get props => [];
}