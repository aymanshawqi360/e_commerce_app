import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;
  late SignupRequestBody signupRequestBody;
  setUp(() {
    json = json = {
      'email': 'test@example.com',
      'password1': '123456',
      'password2': '123456',
      'roles': 'user',
      'terms_accepted': true,
    };

    signupRequestBody = SignupRequestBody(
      confirmPassword: '5555',
      email: 'a123@gmail.com',
      password: '5555',
      roles: 'user',
      termsAccepted: false,
    );
  });

  group("should json to dart  [SignupRequestBody]", () {
    test("should [SignupRequestBodyFromJson]", () {
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
  });
}
