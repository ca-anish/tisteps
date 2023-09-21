part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserListEvent extends UserEvent {
  final int page;

  const UserListEvent({
    required this.page,
  });

  @override
  List<Object> get props => [page];
}

class UserDetailsEvent extends UserEvent {
  final int userId;

  const UserDetailsEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
