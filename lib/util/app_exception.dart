class AppException implements Exception {
  final String? message;
  final String? origin;

  const AppException({this.message = 'Alguma coisa deu muito errado!', this.origin = 'Indefinido'});

  @override
  String toString() => 'AppException { origin:$origin, message: $message }';
}
