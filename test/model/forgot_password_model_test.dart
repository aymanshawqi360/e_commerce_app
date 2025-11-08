import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ForgotPasswordRequestBody forgotPasswordRequestBody;
  late ForgotPasswordResponseModel forgotPasswordResponseModel;
  setUp(() {
    forgotPasswordRequestBody = ForgotPasswordRequestBody(
      email: "test123@gmail.com",
    );
    forgotPasswordResponseModel = ForgotPasswordResponseModel(
      message: 'Password reset link sent to your email.',
    );
  });
  group("group forgot password -related tests for better organization", () {
    test('should json to dart [ForgotPasswordRequestBody] ', () {
      final result = forgotPasswordRequestBody;

      expect(result, isA<ForgotPasswordRequestBody>());
      expect(result.email, 'test123@gmail.com');
    });

    test('should dart to json [ForgotPasswordRequestBody]', () {
      final result = forgotPasswordRequestBody.toJson();

      expect(result['email'], forgotPasswordRequestBody.email);
    });

    test('should json to dart [ForgotPasswordResponseModel] ', () {
      final result = forgotPasswordResponseModel;
      expect(result, isA<ForgotPasswordResponseModel>());
      expect(result.message, 'Password reset link sent to your email.');
    });
    test('should dart to json [ForgotPasswordResponseModel]', () {
      final result = forgotPasswordResponseModel.toJson();

      expect(result['message'], forgotPasswordResponseModel.message);
    });
  });
}
