import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/core/service/service_lacetor.dart';
import 'package:homewood/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = getIt<AuthRepo>();
  AuthCubit() : super(AuthInitial());
  void createUser(
      {required String name, required String email, required String password}) {
    authRepo.createUser(name: name, email: email, password: password).then((result) {
      result.fold(
        (failure) {
          emit(FieldCreateUser(message: failure.errMessage));
        },
        (users) {
          if (users.statusText == '200') {
            emit(CreateUserSuccess());
          } else {
            emit(FieldCreateUser(message: "failure.errMessage"));
          }
        },
      );
    });
  }

  void loginUser(
      {required String email, required String password}) {
    authRepo.loginUser(email: email, password: password).then((result) {
      result.fold(
            (failure) {
          emit(FieldLoginUser(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == '200') {
            emit(LoginUserSuccess());
          } else {
            emit(FieldLoginUser(message: "failure.errMessage"));
          }
        },
      );
    });
  }
  void forgetPassword(
      { required String email,}) {
    authRepo.forgetPassword(email: email).then((result) {
      result.fold(
            (failure) {
          emit(FieldCreateUser(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == '200') {
            emit(SendTokenSuccess());
          } else {
            emit(FieldSendToken(message: "failure.errMessage"));
          }
        },
      );
    });
  }
  void resetPassword(
      {required String token, required String email, required String password}) {
    authRepo.resetPassword(email: email, password: password, token: token).then((result) {
      result.fold(
            (failure) {
          emit(FieldCreateUser(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == '200') {
            emit(CreateUserSuccess());
          } else {
            emit(FieldCreateUser(message: "failure.errMessage"));
          }
        },
      );
    });
  }
}
