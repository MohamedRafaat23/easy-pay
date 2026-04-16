import 'package:dio/dio.dart';
import 'package:easy_bay/api/api_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class GetItModule{
var dio = Dio();
@singleton
@injectable
 BaseOptions provideBaseOption(){
    return BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    receiveDataWhenStatusError: true,
    receiveTimeout: Duration(seconds: 20),
    connectTimeout: Duration(seconds: 20)
    );
  }
  PrettyDioLogger prettyDioLogger(){
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
    );
  }

}







