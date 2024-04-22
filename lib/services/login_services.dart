import 'package:ex_module_core/ex_module_core.dart';

import '../models/auth_model.dart';
import '../models/user_model.dart';

part 'login_services.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/authentication/api/v1/login')
  Future<BaseResponse<AuthModel>> login(@Body() Map<String, dynamic> request,
      {@Header('gCaptcha') String? captchaToken});

  @GET('/users/auth/me')
  Future<BaseResponse<UserModel>> getMe();
}
