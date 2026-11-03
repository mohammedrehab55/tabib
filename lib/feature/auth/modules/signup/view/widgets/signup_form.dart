import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabib/core/helper/app_regex.dart';
import 'package:tabib/core/widgets/app_text_form_filed.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_cubit.dart';
import 'package:tabib/feature/auth/widgets/password_validation.dart';

class SignupForm extends StatefulWidget {
  final GlobalKey formKey;
  const SignupForm({super.key, required this.formKey});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late TextEditingController passwordController;
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool passwordVisibility = true;
  bool confirmPasswordVisibility = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    passwordController = context.read<SignupCubit>().passwordContraller;
    setPasswordListener();
    super.initState();
  }

  void setPasswordListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);

        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            hintText: 'Name',
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            hintText: 'Phone Number',
            controller: phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            hintText: 'Email',
            controller: context.read<SignupCubit>().emailContraller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            isObscureText: passwordVisibility,
            hintText: 'Password',
            controller: passwordController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              },
              icon: Icon(
                passwordVisibility ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          AppTextFormFiled(
            isObscureText: confirmPasswordVisibility,
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  confirmPasswordVisibility = !confirmPasswordVisibility;
                });
              },
              icon: Icon(
                confirmPasswordVisibility
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a vaild password confirmation';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
