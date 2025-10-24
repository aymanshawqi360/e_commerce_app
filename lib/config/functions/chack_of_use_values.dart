import 'package:flutter/material.dart';

class CheckUsedValues {
  CheckUsedValues._();

  static checkUsedValues(
    GlobalKey<FormState> formState,
    void Function() onValid,
  ) {
    if (formState.currentState?.validate() == true) {
      onValid;
    }
  }
}
