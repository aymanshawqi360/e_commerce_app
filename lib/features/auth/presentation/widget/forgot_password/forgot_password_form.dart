import 'package:e_commerce_app/config/functions/chack_of_use_values.dart';
import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_lottie_loading.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late TextEditingController textEditingControllerEmail;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    final cubit = context.read<AuthForgotPasswordCubit>();
    formKey = cubit.formKey;
    textEditingControllerEmail = cubit.emailController;
    super.initState();
  }

  @override
  void dispose() {
    textEditingControllerEmail.dispose();
    formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.email,
              style: TextStyles.font12BlackMedium,
            ),
          ),
          verticalSpacing(4.h),
          AppTextFormField(
            controller: textEditingControllerEmail,
            hintText: StringManager.enterYourEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "Please enter valid email address";
              }
            },
          ),
          verticalSpacing(48.h),
          AppButton(
            onTap: () {
              CheckUsedValues.checkUsedValues(
                formKey,
                onValid: () =>
                    context.read<AuthForgotPasswordCubit>().resetOtpState(),
              );
            },
            widget:
                BlocBuilder<AuthForgotPasswordCubit, AuthForgotPasswordState>(
                  builder: (context, state) {
                    return (state is AuthForgotPasswordLoading)
                        ? AppLottieLoading()
                        : Text(
                            textAlign: TextAlign.center,
                            StringManager.continueForgotPassword,
                            style: TextStyles.font14WhiteBold,
                          );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
