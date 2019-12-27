class TMDBApiResponseException implements Exception {
  final String message;

  const TMDBApiResponseException([this.message = ""]);
}
