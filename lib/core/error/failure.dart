import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioExceptionType dioErrorType) {
    switch (dioErrorType) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timed out. Please check your internet connection and try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Sending data took too long. Please check your network connection and try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receiving data took too long. Please check your network connection and try again.');
      case DioExceptionType.badResponse:
        return ServerFailure('An error occurred while processing the request. Please try again.');
      case DioExceptionType.cancel:
        return ServerFailure('The request was cancelled. Please try again.');
      case DioExceptionType.connectionError:
        return ServerFailure('There was a connection problem. Please check your internet connection and try again.');
      default:
        return ServerFailure('An unexpected error occurred. Please try again later');
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