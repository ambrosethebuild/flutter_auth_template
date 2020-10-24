import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_template/constants/api.dart';
import 'package:flutter_auth_template/models/api_response.dart';
import 'package:flutter_auth_template/services/http.service.dart';

class AuthRequest extends HttpService {
  Future<ApiResponse> loginRequest({
    @required String email,
    @required String password,
  }) async {
    final apiResult = await post(
      Api.login,
      {
        "email": email,
        "password": password,
      },
    );

    return ApiResponse.fromResponse(apiResult);
  }
}
