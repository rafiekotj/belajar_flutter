import 'dart:developer';

import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/components/custom_text_field.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:belajar_flutter/tugas_15/api/login.dart';
import 'package:belajar_flutter/tugas_15/views/auth/register_screen.dart';
import 'package:belajar_flutter/tugas_15/views/profile/profile_screen.dart';
import 'package:belajar_flutter/tugas_15/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isVisibility = true;
  bool isLoading = false;
  bool isCheckingSession = true;

  @override
  void initState() {
    super.initState();
    _checkSavedLogin();
  }

  Future<void> _checkSavedLogin() async {
    final isLogin = await PreferenceHandler.getIsLogin();
    final token = await PreferenceHandler.getToken();

    if (!mounted) return;

    if (isLogin == true && (token?.isNotEmpty ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.pushAndRemoveAll(const ProfileScreen());
      });
      return;
    }

    setState(() {
      isCheckingSession = false;
    });
  }

  void visibilityOnOff() {
    setState(() {
      isVisibility = !isVisibility;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isCheckingSession) {
      return const Scaffold(
        backgroundColor: AppColor.backgroundLight,
        body: Center(child: CircularProgressIndicator(color: AppColor.primary)),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundLight,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                            child: Image.asset(
                              'assets/icons/rentora_logo.png',
                              width: 200,
                            ),
                          ),
                          const SizedBox(height: 64),
                          const Text(
                            'Masuk ke Rentora',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: emailController,
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              final email = (value ?? '').trim();
                              if (email.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              if (!email.contains('@')) {
                                return 'Email tidak valid';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: passwordController,
                            hintText: 'Kata Sandi',
                            prefixIcon: Icons.lock_outline,
                            obscureText: isVisibility,
                            suffixIcon: InkWell(
                              onTap: visibilityOnOff,
                              child: Icon(
                                size: 20,
                                isVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            validator: (value) {
                              final password = value ?? '';
                              if (password.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              if (password.length < 6) {
                                return 'Password minimal 6 karakter';
                              }
                              if (!RegExp(r'[A-Z]').hasMatch(password)) {
                                return 'Minimal 1 huruf besar';
                              }
                              if (!RegExp(r'[a-z]').hasMatch(password)) {
                                return 'Minimal 1 huruf kecil';
                              }
                              if (!RegExp(r'\d').hasMatch(password)) {
                                return 'Minimal 1 angka';
                              }
                              if (!RegExp(
                                r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\];\`~+=]',
                              ).hasMatch(password)) {
                                return 'Minimal 1 karakter spesial';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Lupa Kata Sandi?',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            text: 'Masuk',
                            isLoading: isLoading,
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              setState(() {
                                isLoading = true;
                              });

                              String message = 'Login gagal';
                              String token = '';

                              try {
                                final login = await loginUser(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );

                                token = login?.data?.token ?? '';
                                message = login?.message ?? 'Login berhasil';

                                if (token.isNotEmpty) {
                                  await PreferenceHandler().storingToken(token);
                                  await PreferenceHandler().storingIsLogin(
                                    true,
                                  );
                                }
                              } catch (e) {
                                log(e.toString());
                                message = e
                                    .toString()
                                    .replaceFirst('Exception: ', '')
                                    .replaceFirst('HttpException: ', '')
                                    .trim();
                              }

                              if (!mounted) return;

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(message)));

                              setState(() {
                                isLoading = false;
                              });

                              if (token.isNotEmpty) {
                                context.pushAndRemoveAll(const ProfileScreen());
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'atau masuk dengan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.textHint,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const CustomButton(
                            text: 'Google',
                            isOutlined: true,
                            iconAsset: 'assets/icons/google.png',
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Belum punya akun? ',
                                style: TextStyle(color: AppColor.textHint),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.push(const RegisterScreen());
                                },
                                child: const Text(
                                  'Daftar sekarang',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
