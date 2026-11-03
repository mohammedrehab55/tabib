import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/core/widgets/app_text_button.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_cubit.dart';
import 'package:tabib/feature/auth/modules/signup/view/widgets/signup_bloc_listener.dart';
import 'package:tabib/feature/auth/widgets/terms_and_conditions_text.dart';
import 'package:tabib/feature/auth/modules/signup/view/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final formKey = GlobalKey<FormState>();
  void validateThenSignup() {
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: TextStyles.font24BlueBold),
                SizedBox(height: 12.h),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GreyRegular.copyWith(height: 1.6.sp),
                ),
                SizedBox(height: 20.h),

                SignupForm(formKey: formKey),
                SizedBox(height: 30.h),

                AppTextButton(
                  title: 'Create Account',
                  onPressed: () {
                    validateThenSignup();
                    cubit.emitSignupStates(
                      cubit.emailContraller.text,
                      cubit.passwordContraller.text,
                    );
                  },
                ),
                SizedBox(height: 10.h),
                const TermsAndConditionsText(),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
