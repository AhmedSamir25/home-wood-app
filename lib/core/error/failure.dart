import 'package:dio/dio.dart';
import 'package:homewood/core/localization/confing_lang.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioExceptionType dioErrorType) {
    switch (dioErrorType) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(ConfingLang.localizations['connectionTimed']);
      case DioExceptionType.sendTimeout:
        return ServerFailure('Sending data took too long. Please check your network connection and try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(ConfingLang.localizations["receiveTimeout"]);
      case DioExceptionType.badResponse:
        return ServerFailure(ConfingLang.localizations['badResponse']);
      case DioExceptionType.cancel:
        return ServerFailure(ConfingLang.localizations['cancelResponse']);
      case DioExceptionType.connectionError:
        return ServerFailure(ConfingLang.localizations['connectionError']);
      default:
        return ServerFailure(ConfingLang.localizations['unexpectedError']);
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure('Invalid request. Please check your input and try again.');
    } else if (statusCode == 401) {
      return ServerFailure('Unauthorized access. Please check your credentials and try again.');
    } else if (statusCode == 403) {
      return ServerFailure('Forbidden access. You do not have permission to perform this action.');
    } else if (statusCode == 404) {
      return ServerFailure('The requested resource was not found. Please try again later.');
    } else if (statusCode == 500) {
      return ServerFailure('There was a problem with the server. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred. Please try again later. If the problem persists, please contact support.');
    }
  }
}