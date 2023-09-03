class ApiResponse {
  Object? _data;
  String _error = '';
  // this boolen to control either we reach the server or not (no connection, wrong endpoint...)
  bool _isServerContacSuccess = true;
  Object? get data => _data;
  set data(data) => _data = data;

  String get error => _error;
  set error(error) => _error = error;

  bool get isServerContacSuccess => _isServerContacSuccess;
  set isServerContacSuccess(val) => _isServerContacSuccess = val;
}
