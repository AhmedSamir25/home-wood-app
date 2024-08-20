import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioException.connectionTimeout:
        return ServerFailure('Connection timed out. Please try again.');

      case DioException.sendTimeout:
        return ServerFailure('Sending data took too long. Please try again.');

      case DioException.receiveTimeout:
        return ServerFailure('Receiving data took too long. Please try again.');

      case DioException.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);

      case DioException.requestCancelled:
        return ServerFailure('The request was cancelled. Please try again.');

      default:
        return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('Request is invalid or unauthorized. Please check and try again.');
    } else if (statusCode == 404) {
      return ServerFailure('The requested resource was not found. Please try again later.');
    } else if (statusCode == 500) {
      return ServerFailure('There was a problem with the server. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }
}
