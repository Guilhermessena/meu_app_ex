class NomeInvalidoException implements Exception {
  String error() => "Nome invalido";
  @override
  String toString() {
    // TODO: implement toString
    return "NomeInvalidoException: ${error()}";
  }
}
