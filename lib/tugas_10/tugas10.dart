import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
// import 'package:belajar_flutter/tugas_10/home_daftar.dart';
import 'package:belajar_flutter/tugas_10/components/custom_text_field.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:belajar_flutter/tugas_11/database/sqflite.dart';
import 'package:belajar_flutter/tugas_11/models/user_model.dart';
import 'package:belajar_flutter/tugas_11/views/drawer.dart';
import 'package:flutter/material.dart';

class Tugas10Flutter extends StatefulWidget {
  const Tugas10Flutter({super.key});

  @override
  State<Tugas10Flutter> createState() => _Tugas10FlutterState();
}

class _Tugas10FlutterState extends State<Tugas10Flutter> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isVisibility = true;

  void visibilityOnOff() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewInsets.bottom,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/icons/rentora_logo.png",
                    width: 200,
                  ),
                ),

                SizedBox(height: 64),

                Text(
                  "Daftar ke Rentora",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 16),

                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else if (!value.contains("@")) {
                      return "Email tidak valid";
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 8),

                CustomTextField(
                  controller: passwordController,
                  hintText: "Kata Sandi",
                  prefixIcon: Icons.lock_outline,
                  obscureText: isVisibility,
                  suffixIcon: InkWell(
                    onTap: visibilityOnOff,
                    child: Icon(
                      size: 20,
                      isVisibility ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  validator: (value) {
                    final password = value ?? "";
                    if (password.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if (password.length < 6) {
                      return "Password minimal 6 karakter";
                    }

                    final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
                    final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
                    final hasNumber = RegExp(r'\d').hasMatch(password);
                    final hasSpecialChar = RegExp(
                      r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\];\`~+=]',
                    ).hasMatch(password);

                    if (!hasUppercase) {
                      return "Password harus mengandung minimal 1 huruf besar";
                    }
                    if (!hasLowercase) {
                      return "Password harus mengandung minimal 1 huruf kecil";
                    }
                    if (!hasNumber) {
                      return "Password harus mengandung minimal 1 angka";
                    }
                    if (!hasSpecialChar) {
                      return "Password harus mengandung minimal 1 karakter spesial";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final UserModel? login = await DBHelper.loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (login != null) {
                          PreferenceHandler().storingIsLogin(true);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Berhasil")),
                          );
                          await Future.delayed(Duration(seconds: 2));
                          context.push(DrawerGlobal());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Login Gagal, email atau password tidak terdaftar",
                              ),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DBHelper.registerUser(
                          UserModel(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Pendaftaran Berhasil")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "atau daftar dengan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.textHint,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      side: BorderSide(color: AppColor.textHint),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/icons/google.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            color: AppColor.textHint,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }

  Future<dynamic> dialogError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            "Konfirmasi Data",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Silakan periksa kembali data Anda:"),

              SizedBox(height: 8),

              Text("Nama: ${nameController.text}"),
              Text("Email: ${emailController.text}"),
              Text("No. Telepon: ${phoneController.text}"),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColor.error),
                        foregroundColor: AppColor.error,
                      ),
                      child: Text(
                        "Batal",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        // DBHelper.registerUser(
                        //   UserModel(
                        //     email: emailController.text,
                        //     password: passwordController.text,
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text("Pendaftaran Berhasil")),
                        // );
                        PreferenceHandler().storingIsLogin(true);
                        context.push(DrawerGlobal());
                        // context.push(
                        // HomeDaftarPage(
                        // name: nameController.text,
                        // phone: phoneController.text,
                        // ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.success,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Lanjut",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
