import 'package:dio/dio.dart';

sealed class ErrorModel {
  String message;
  String? errorCode;
  // TODO LOCALIZATION FOR ALL FILE
  ErrorModel({required this.message, this.errorCode});
  static ErrorModel errorHandler(Exception error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return TypeParseError(errorMessage: error.toString());
    }
  }

  static ErrorModel _handleDioError(DioException e) {
    String? customeErrorMessage = e.response?.data?['message'];
    if (customeErrorMessage != null) {
      return RequestError(errorMessage: customeErrorMessage);
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkError();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return AuthError(errorMessage: e.response?.data['message'] ?? '');
        } else if (statusCode == 404) {
          return RequestError();
        } else {
          return ServerError();
        }

      case DioExceptionType.cancel:
        return GeneralError();

      default:
        return GeneralError();
    }
  }
}

class GeneralError extends ErrorModel {
  GeneralError({String? errorMessage, super.errorCode})
    : super(
        message: errorMessage ?? "Something went wrong!!",
      ); //TODO localization
}

class TypeParseError extends ErrorModel {
  TypeParseError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? "Parsing data error!!");
}

class AuthError extends ErrorModel {
  AuthError({String? errorMessage, super.errorCode})
    : super(message: errorMessage ?? "Auth error!!");
}

class NetworkError extends ErrorModel {
  NetworkError() : super(message: "No server connection!!");
}

class RequestError extends ErrorModel {
  RequestError({String? errorMessage})
    : super(
        message:
            errorMessage ??
            "Something went wrong while connection to the server!!",
      );
}

class ServerError extends ErrorModel {
  ServerError() : super(message: "Server Error!!");
}
