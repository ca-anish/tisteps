import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tisteps/api/api_exception.dart';
import 'package:tisteps/data/user_data_service.dart';
import 'package:tisteps/model/get_user_details_model.dart';
import 'package:tisteps/model/user_response_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(AppLoading()) {
    on<UserListEvent>(mapGetUserListState);
    on<UserDetailsEvent>(mapGetUserDetailsState);
  }

  Future<void> mapGetUserListState(UserListEvent event, Emitter emit) async {
    try {
      emit(UserLoadingState());
      UserResponseModel userResponseModel =
          await UserDataService().getUserList(event.page);
      emit(UserListLoaded(userResponseModel));
    } on AuthException catch (e) {
      emit(UserListError(e.message));
    } catch (e) {
      emit(const UserListError('Something Went Wrong'));
    }
  }

  Future<void> mapGetUserDetailsState(
      UserDetailsEvent event, Emitter emit) async {
    try {
      emit(UserLoadingState());
      GetUserDetailsModel getUserDetailsModel =
          await UserDataService().getUserDetails(event.userId);
      emit(UserDetailsLoaded(getUserDetailsModel));
    } on AuthException catch (e) {
      emit(UserListError(e.message));
    } catch (e) {
      emit(const UserListError('Something Went Wrong'));
    }
  }
}
