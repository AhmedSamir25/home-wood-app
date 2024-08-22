import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homewood/core/helper/storage/save_userid.dart';
import 'package:homewood/core/localization/confing_lang.dart';
import 'package:homewood/core/service/service_lacetor.dart';
import 'package:homewood/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = getIt<AuthRepo>();
  int tokenField = 0 ;
  String email = "";
  SaveUserId saveUserId = SaveUserId();
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
            saveUserId.setUserId(userId: users.userId!);
            emit(CreateUserSuccess());
          } else {
            emit(FieldCreateUser(message: ConfingLang.localizations["unexpectedError"]));
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
            saveUserId.setUserId(userId: users.userId!);
            emit(LoginUserSuccess());
          } else {
            emit(FieldLoginUser(message: ConfingLang.localizations["unexpectedError"]));
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
            emit(FieldSendToken(message: ConfingLang.localizations["unexpectedError"]));
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
            emit(FieldResetPassword(message: ConfingLang.localizations["unexpectedError"]));
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
            emit(FieldCheckToken(message: ConfingLang.localizations["unexpectedError"]));
          }
        },
      );
    });
  }
}

