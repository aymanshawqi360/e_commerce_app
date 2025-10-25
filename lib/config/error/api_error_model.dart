import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(name: "message")
  String? errorMessage;
  final Map<String, dynamic>? errors;
  ApiErrorModel({required this.errorMessage, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String allError() {
    if (errors == null || errors!.isEmpty) return "Unknown error occurred";
    StringBuffer message = StringBuffer();

    errors?.forEach((key, value) {
      if (value is List) {
        for (String messages in value) {
          message.writeln("— $messages");
        }
      }
    });
    return message.toString();
  }
}
