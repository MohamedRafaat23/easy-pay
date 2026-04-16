import 'package:dio/dio.dart';
import 'package:easy_bay/api/api_endpoints.dart';
import 'package:easy_bay/api/model/request/login_request_dto.dart';
import 'package:easy_bay/api/model/request/register_request_dto.dart';
import 'package:easy_bay/api/model/response/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_serveses.g.dart';
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServeses {
  factory ApiServeses(Dio dio, {String? baseUrl}) = _ApiServeses;

  @POST(ApiEndpoints.loginApi)
  Future<AuthResponseDto>login(@Body()LoginRequestDto loginRequestDto);
  @POST(ApiEndpoints.registerApi)
  Future<AuthResponseDto>register(@Body()RegisterRequestDto registerRequestDto);

}
