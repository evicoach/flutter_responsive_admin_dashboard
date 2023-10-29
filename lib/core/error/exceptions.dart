class ServerException implements Exception {
  final String? message;
  final Map<String, dynamic>? data;
  ServerException({this.message, this.data});
}

class CacheException implements Exception {}
