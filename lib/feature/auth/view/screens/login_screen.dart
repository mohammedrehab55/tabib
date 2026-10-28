import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/core/widgets/app_text_form_filed.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:tabib/feature/auth/view/widgets/alerady_have_account_text.dart';
import 'package:tabib/feature/auth/view/widgets/auth_bloc_listner.dart';
import 'package:tabib/feature/auth/view/widgets/other_ways_to_register.dart';
import 'package:tabib/feature/auth/view/widgets/sign_in_with_text.dart';
import 'package:tabib/feature/auth/view/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    debugPrint(cubit.hashCode.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                SizedBox(height: 12.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last\nlogged in.',
                  style: TextStyles.font14GreyRegular.copyWith(height: 1.6.sp),
                ),
                SizedBox(height: 20.h),

                AppTextFormFiled(
                  hintText: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: 12.h),
                AppTextFormFiled(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility),
                  isObscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font12BlueRegular,
                  ),
                ),
                SizedBox(height: 30.h),

                AppTextButton(
                  title: 'Login',
                  onPressed: () => cubit.emitLogInStates(
                    emailController.text,
                    passwordController.text,
                  ),
                ),
                SizedBox(height: 40.h),
                const SignInWithText(),
                SizedBox(height: 40.h),
                const OtherWaysToRegister(),
                SizedBox(height: 40.h),
                const TermsAndConditionsText(),
                SizedBox(height: 30.h),
                Align(child: const AleradyHaveAccountText()),

                AuthBlocListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
