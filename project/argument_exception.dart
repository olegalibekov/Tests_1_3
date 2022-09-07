class ArgumentException implements Exception {
  ArgumentException([this.exceptionMessage]);

  final String? exceptionMessage;

  @override
  String toString() {
    return exceptionMessage ?? 'ArgumentException';
  }
}
