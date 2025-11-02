import 'package:e_commerce_app/config/constants/user_roles.dart';
import 'package:e_commerce_app/config/functions/chack_of_use_values.dart';
import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_lottie_loading.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupFrom extends StatefulWidget {
  const SignupFrom({super.key});

  @override
  State<SignupFrom> createState() => _SignupFromState();
}

class _SignupFromState extends State<SignupFrom> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> fromKey;

  @override
  void initState() {
    final cubit = context.read<SignupCubit>();
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
    confirmPasswordController = cubit.confirmPasswordController;

    fromKey = cubit.formKey;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Form(
      key: fromKey,

      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.signupwithEmail,
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

          verticalSpacing(15.h),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(StringManager.confirmPassword),
          ),
          verticalSpacing(2.h),
          AppTextFormField(
            controller: confirmPasswordController,
            horizontal: 16.w,
            vertical: 14.h,
            hintText: StringManager.enterYourConfirmPassword,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "confirm password must not be empty";
              }
            },
          ),
          verticalSpacing(15.h),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(StringManager.userRole),
          ),

          DropdownButtonFormField<String>(
            initialValue: cubit.selectedValue,
            dropdownColor: Color(0xFFFBFBFC),

            decoration: InputDecoration(
              hintStyle: TextStyles.font12SoftGrayRegular,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsManager.softGray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsManager.softGray),
              ),
            ),
            borderRadius: BorderRadius.circular(8),
            alignment: Alignment.center,

            items: UserRoles.items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: TextStyles.font12BlackLight,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              cubit.dropdownState(value: value);
            },
          ),

          BlocBuilder<SignupCubit, SignupState>(
            buildWhen: (previous, current) =>
                current is AuthSignupLoading ||
                current is AuthSignupSuccess ||
                current is TermsAcceptedState ||
                current is AuthSignupFailure,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 19.w,
                        child: Checkbox(
                          activeColor: ColorsManager.gruyDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: cubit.isAccepted,
                          onChanged: (value) {
                            cubit.termsAcceptedState(value: value);
                          },
                        ),
                      ),
                      horizontalSpacing(5.w),
                      Text(
                        StringManager.agreeWith,
                        style: TextStyles.font12BlackLight,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          StringManager.termsCondition,
                          style: TextStyles.font12PurpleLight,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(48.h),
                  AbsorbPointer(
                    absorbing: !cubit.isAccepted,
                    child: Opacity(
                      opacity: cubit.isAccepted ? 1.0 : 0.5,
                      child: AppButton(
                        widget: Center(
                          child: (state is AuthSignupLoading)
                              ? AppLottieLoading()
                              : Text(
                                  textAlign: TextAlign.center,
                                  StringManager.signUp,
                                  style: TextStyles.font13WhiteBold,
                                ),
                        ),

                        onTap: () {
                          CheckUsedValues.checkUsedValues(
                            fromKey,
                            onValid: () => cubit.signUpState(),
                          );
                        },
                      ),
                    ),
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
