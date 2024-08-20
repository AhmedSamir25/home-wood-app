import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/core/service/service_lacetor.dart';
import 'package:homewood/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = getIt<AuthRepo>();
  int tokenField = 0 ;
  String email = "";
  AuthCubit() : super(AuthInitial());
  void createUser(
      {required String name, required String email, required String password}) async{
    emit(AuthLoading());
   await authRepo.createUser(name: name, email: email, password: password).then((result) {
      result.fold(
        (failure) {
          emit(FieldCreateUser(message: failure.errMessage));
        },
        (users) {
          if (users.statusText == 'Ok') {
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
    emit(AuthLoading());
    authRepo.loginUser(email: email, password: password).then((result) {
      result.fold(
            (failure) {
          emit(FieldLoginUser(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == 'Ok') {
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
    emit(AuthLoading());
    authRepo.forgetPassword(email: email).then((result) {
      result.fold(
            (failure) {
          emit(FieldCreateUser(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == 'Ok') {
            emit(SendTokenSuccess());
          } else {
            emit(FieldSendToken(message: "failure.errMessage"));
          }
        },
      );
    });
  }
  void resetPassword(
      {required int token, required String email, required String password}) {
    emit(AuthLoading());
    authRepo.resetPassword(email: email, password: password, token: token).then((result) {
      result.fold(
            (failure) {
          emit(FieldResetPassword(message: failure.errMessage));
        },
            (users) {
          if (users.statusText == 'Ok') {
            emit(ResetPasswordSuccess());
          } else {
            emit(FieldResetPassword(message: "failure.errMessage"));
          }
        },
      );
    });
  }
  void checkToken({required String email, required int token}){
    emit(AuthLoading());
    authRepo.checkToken(email: email, token: token).then((result) {
      result.fold((failure){
        emit(FieldCheckToken(message: failure.errMessage));
      },
            (users) {
          if (users.statusText == 'Ok') {
            emit(CheckTokenSuccess());
          } else {
            emit(FieldCheckToken(message: "failure.errMessage"));
          }
        },
      );
    });
  }
}

