class TMDBApiResponseException implements Exception {
  const TMDBApiResponseException([this.message = '']);

  final String message;
}
