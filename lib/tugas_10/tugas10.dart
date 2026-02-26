import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:belajar_flutter/tugas_10/home_daftar.dart';
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

                TextFormField(
                  controller: nameController,
                  cursorColor: AppColor.textHint,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: AppColor.textHint,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),

                    contentPadding: EdgeInsets.all(12),

                    prefixIcon: Icon(Icons.person, size: 20),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return AppColor.error;
                      }
                      if (states.contains(WidgetState.focused)) {
                        return AppColor.secondary;
                      }
                      return AppColor.textHint;
                    }),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.textHint),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.secondary),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    errorStyle: TextStyle(
                      color: AppColor.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  validator: (value) {
                    final name = value ?? "";
                    if (name.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    if (name.length < 2) {
                      return "Nama minimal 2 karakter";
                    }

                    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
                    if (!nameRegex.hasMatch(name)) {
                      return "Nama hanya boleh huruf";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 8),

                TextFormField(
                  controller: emailController,
                  cursorColor: AppColor.textHint,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: AppColor.textHint,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),

                    contentPadding: EdgeInsets.all(12),

                    prefixIcon: Icon(Icons.email_outlined, size: 20),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return AppColor.error;
                      }
                      if (states.contains(WidgetState.focused)) {
                        return AppColor.secondary;
                      }
                      return AppColor.textHint;
                    }),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.textHint),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.secondary),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    errorStyle: TextStyle(
                      color: AppColor.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

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

                TextFormField(
                  controller: passwordController,
                  cursorColor: AppColor.textHint,
                  obscureText: isVisibility,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Kata Sandi",
                    hintStyle: TextStyle(
                      color: AppColor.textHint,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),

                    contentPadding: EdgeInsets.all(12),

                    prefixIcon: Icon(Icons.lock_outline, size: 20),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return AppColor.error;
                      }
                      if (states.contains(WidgetState.focused)) {
                        return AppColor.secondary;
                      }
                      return AppColor.textHint;
                    }),

                    suffixIcon: InkWell(
                      onTap: visibilityOnOff,
                      child: Icon(
                        size: 20,
                        isVisibility ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    suffixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return AppColor.error;
                      }
                      if (states.contains(WidgetState.focused)) {
                        return AppColor.secondary;
                      }
                      return AppColor.textHint;
                    }),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.textHint),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.secondary),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    errorStyle: TextStyle(
                      color: AppColor.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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

                SizedBox(height: 8),

                TextFormField(
                  controller: phoneController,
                  cursorColor: AppColor.textHint,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Nomor Telepon",
                    hintStyle: TextStyle(
                      color: AppColor.textHint,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),

                    contentPadding: EdgeInsets.all(12),

                    prefixIcon: Icon(Icons.phone, size: 20),
                    prefixIconColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.error)) {
                        return AppColor.error;
                      }
                      if (states.contains(WidgetState.focused)) {
                        return AppColor.secondary;
                      }
                      return AppColor.textHint;
                    }),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.textHint),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.secondary),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColor.error),
                    ),

                    errorStyle: TextStyle(
                      color: AppColor.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  validator: (value) {
                    final phone = (value ?? '').trim();
                    if (phone.isEmpty) {
                      return "Nomor telepon tidak boleh kosong";
                    }
                    if (!RegExp(r'^\d+$').hasMatch(phone)) {
                      return "Nomor telepon hanya boleh angka";
                    }
                    if (phone.length < 9) {
                      return "Nomor telepon minimal 9 digit";
                    }
                    if (phone.length > 15) {
                      return "Nomor telepon maksimal 15 digit";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print("Berhasil tervalidasi");
                        dialogError(context);
                      } else {
                        // print("Tidak Berhasil tervalidasi");
                      }
                      // print(nameController.text);
                      // print(emailController.text);
                      // print(passwordController.text);
                      // print(phoneController.text);
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
                        context.push(
                          HomeDaftarPage(
                            name: nameController.text,
                            phone: phoneController.text,
                          ),
                        );
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
