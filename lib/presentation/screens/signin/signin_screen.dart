import 'package:financial_system/business_logic/blocs/signin/signin_bloc.dart';
import 'package:financial_system/business_logic/blocs/signin/signin_event.dart';
import 'package:financial_system/business_logic/blocs/signin/signin_state.dart';
import 'package:financial_system/core/mixins/validators_mixin.dart';
import 'package:financial_system/core/values/assets.dart';
import 'package:financial_system/core/values/snackbar.dart';
import 'package:financial_system/data/models/auth_model.dart';
import 'package:financial_system/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> with ValidatorsMixin {
  final obscureText = ValueNotifier(true);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    obscureText.dispose();

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.sizeOf(context);

    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state.status.isError) {
          ErrorSnackbar(context, message: state.error);
        }
        if (state.status.isSuccess) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
      },
      child: Stack(
        children: [
          Scaffold(
            body: LayoutBuilder(
              builder: (_, constraints) {
                return Row(
                  children: [
                    Visibility(
                      visible: size.width > 800,
                      child: Expanded(
                        child: Container(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.signinIllustration,
                              width: size.width * .25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Login',
                                  style: theme.textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.email),
                                    label: Text(
                                      'Email',
                                    ),
                                  ),
                                  validator: (value) => combine([
                                    () => isNotEmpty(value),
                                    () => isValidEmail(value),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ValueListenableBuilder(
                                  valueListenable: obscureText,
                                  builder: (context, value, child) {
                                    return TextFormField(
                                      controller: passwordController,
                                      textInputAction: TextInputAction.send,
                                      onFieldSubmitted: (_) {
                                        _signin();
                                      },
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Icon(Icons.lock),
                                        suffixIcon: IconButton(
                                          onPressed: _toggleObscurePass,
                                          icon: obscureText.value
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off),
                                        ),
                                        label: const Text('Senha'),
                                      ),
                                      obscureText: obscureText.value,
                                      validator: isNotEmpty,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        'Esqueci minha senha',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.forgotPassword,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (!(formKey.currentState
                                                    ?.validate() ??
                                                false)) return;
                                            _signin();
                                          },
                                          child: const Text('Entrar'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextButton(
                                  child: Text(
                                    'Ainda não tem uma conta? clique aqui',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // TODO tratar caso de quando aperta tab, msm carregando troca de input
          BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) {
              return Visibility(
                visible: state.status.isLoading,
                child: Container(
                  color: Colors.black38,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _toggleObscurePass() {
    obscureText.value = !obscureText.value;
  }

  void _signin() {
    BlocProvider.of<SigninBloc>(context).add(
      SigninLoginEvent(
        auth: AuthModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      ),
    );
  }
}
