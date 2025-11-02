import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;
  late SignupRequestBody signupRequestBody;
  late LoginRequestBody loginRequestBody;
  setUp(() {
    json = json = {
      'email': 'test@example.com',
      'password1': '123456',
      'password2': '123456',
      'roles': 'user',
      'terms_accepted': true,
    };

    loginRequestBody = LoginRequestBody(
      email: 'test123@gmail.com',
      password: 'test123456789',
    );

    signupRequestBody = SignupRequestBody(
      confirmPassword: '5555',
      email: 'a123@gmail.com',
      password: '5555',
      roles: 'user',
      termsAccepted: false,
    );
  });

  group(
    "test(auth): group authentication-related tests for better organization",
    () {
      test("should json to dart [SignupRequestBodyFromJson]", () {
        final result = SignupRequestBody.fromJson(json);

        expect(result.email, 'test@example.com');
        expect(result.confirmPassword, '123456');
        expect(result.password, '123456');
        expect(result.roles, 'user');
        expect(result.termsAccepted, true);
      });

      test("should dart to json  [SignupRequestBodyToJson]", () {
        final map = signupRequestBody.toJson();
        expect(map['email'], signupRequestBody.email);
        expect(map['password1'], signupRequestBody.password);
        expect(map['password2'], signupRequestBody.confirmPassword);
        expect(map['roles'], signupRequestBody.roles);
        expect(map['terms_accepted'], signupRequestBody.termsAccepted);
      });

      test("should json to dart [LoginRequestBodyFromJson]", () {
        final result = LoginRequestBody.fromJson({
          'email': 'test123@gmail.com',
          'password': 'test123456789',
        });

        expect(result.email, 'test123@gmail.com');
        expect(result.password, 'test123456789');
      });

      test("should dart to json  [LoginRequestBodyToJson]", () {
        final map = loginRequestBody.toJson();
        expect(map['email'], loginRequestBody.email);
        expect(map['password'], loginRequestBody.password);
      });
    },
  );
}
