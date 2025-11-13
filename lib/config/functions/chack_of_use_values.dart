import 'package:flutter/material.dart';

class CheckUsedValues {
  CheckUsedValues._();

  static void checkUsedValues(
    GlobalKey<FormState> formState, {
    required void Function() onValid,
  }) {
    if (formState.currentState!.validate()) {
      onValid();
    }
  }
}
