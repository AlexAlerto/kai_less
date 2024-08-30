class ResponseModel<T> {
  final T? data;
  final String? error;

  bool get hasData => data != null;

  ResponseModel(this.data, this.error);

  factory ResponseModel.success(T data) {
    return ResponseModel(data, null);
  }

  factory ResponseModel.error(String error) {
    return ResponseModel(null, error);
  }
}
