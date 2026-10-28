import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabib/core/routing/routes.dart';
import 'package:tabib/core/theme/color_manager.dart';
import 'package:tabib/core/theme/texts_styles.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_cubit.dart';
import 'package:tabib/feature/auth/logic/cubit/auth_state.dart';

class AuthBlocListner extends StatelessWidget {
  const AuthBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
          success: () => Navigator.pushNamed(context, Routes.homePageRoute),
          failure: (error) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.error, color: Colors.red, size: 32),
                content: Text(error, style: TextStyles.font24BlueBold),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Got it', style: TextStyles.font12BlueRegular),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
