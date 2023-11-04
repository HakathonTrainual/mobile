class EnvironmentProvider {
  static const String _baseUrl = String.fromEnvironment('baseUrl');
  String get baseUrl => _baseUrl;
}
