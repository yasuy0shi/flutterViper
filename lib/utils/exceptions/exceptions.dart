class ResourceException implements Exception {
  ResourceException({required this.message, this.context});

  String message;
  Map<String, dynamic>? context;

  @override
  String toString() {
    if (context == null) return "ResourceException: $message";
    return "ResourceException: $message \n Context: ${context.toString()}";
  }
}

/// 認証における例外クラス
class AuthenticationException implements Exception {
  /// コンストラクタ
  AuthenticationException({required this.message});

  String message;
}

class APIException extends ResourceException {
  APIException({
    required super.message,
    super.context,
    required this.statusCode,
    required this.url,
  });

  int statusCode;
  String url;

  @override
  String toString() {
    if (context == null) return "APIException: $message \n StatusCode: $statusCode \n URL: $url";
    return "APIException: $message \n StatusCode: $statusCode \n URL: $url";
  }
}

class DataHandlingException extends ResourceException {
  DataHandlingException({
    required super.message,
    super.context,
  });
}

class InteractorException extends ResourceException {
  InteractorException({
    required super.message,
    super.context,
  });
}

/// 画面表示における例外クラス
class UIException extends ResourceException {
  UIException({
    required super.message,
    super.context,
  });

  @override
  String toString() {
    return message;
  }
}
