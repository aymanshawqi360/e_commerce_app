import 'package:e_commerce_app/config/functions/chack_of_use_values.dart';
import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_lottie_loading.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    final cubit = context.read<LoginCubit>();
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
    formKey = cubit.formKey;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.loginWithEmail,
              style: TextStyles.font24BlackBold,
            ),
          ),
          verticalSpacing(48.h),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(StringManager.email),
          ),
          verticalSpacing(2.h),
          AppTextFormField(
            controller: emailController,
            horizontal: 16.w,
            vertical: 14.h,
            hintText: StringManager.enterYourEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "email must not be empty";
              }
            },
          ),
          verticalSpacing(15.h),

          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(StringManager.password),
          ),
          verticalSpacing(2.h),
          AppTextFormField(
            controller: passwordController,
            horizontal: 16.w,
            vertical: 14.h,
            hintText: StringManager.enterYourPassword,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "password must not be empty";
              }
            },
          ),

          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Column(
                children: [
                  verticalSpacing(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 19.w,
                        child: Checkbox(
                          activeColor: ColorsManager.gruyDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      Text("Forgot Password"),
                    ],
                  ),
                  verticalSpacing(45.h),
                  AppButton(
                    widget: Center(
                      child: (state is AuthLoginLoading)
                          ? AppLottieLoading()
                          : Text(
                              StringManager.login,
                              style: TextStyles.font13WhiteBold,
                            ),
                    ),

                    onTap: () {
                      CheckUsedValues.checkUsedValues(
                        formKey,
                        onValid: () => cubit.loginState(),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
