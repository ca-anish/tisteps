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