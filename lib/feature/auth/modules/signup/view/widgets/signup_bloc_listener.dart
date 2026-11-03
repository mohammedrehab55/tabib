import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_cubit.dart';
import 'package:tabib/feature/auth/modules/signup/logic/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(color: ColorManager.mainBlue),
              ),
            );
          },
          success: () => Navigator.pushNamed(
            context,
            Routes.doctorPersonalInformationRoute,
          ),
          failure: (error) => Navigator.pop(context),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
