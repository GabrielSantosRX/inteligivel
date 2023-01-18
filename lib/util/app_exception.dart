class AppException implements Exception {
  final String message;
  final Type inception;

  const AppException({this.message = 'Falha catastrófica!', this.inception = Object});

  String get origin => inception.toString();

  @override
  String toString() => 'AppException { origin:$origin, message: $message }';
}
