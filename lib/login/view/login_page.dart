import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_guide_ui/style_guide_ui.dart';
import 'package:thence_style_guide/login/cubit/login_cubit.dart';
import 'package:thence_style_guide/shared/cubit/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    void sigInWithGoogle() {
      context.read<LoginCubit>().sigInWithGoogle();
    }

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoggedSuccess) {
          context.read<AuthBloc>().add(LoggedIn());
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              AppButton(title: 'Login', onTap: sigInWithGoogle),
            ],
          ),
        ),
      ),
    );
  }
}
