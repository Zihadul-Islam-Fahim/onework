class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final String msg;
  final dynamic responseData;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
    this.msg = 'Something went wrong!!',
  });
}