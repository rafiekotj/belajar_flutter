import 'package:belajar_flutter/tugas_6/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 58, backgroundColor: Color(0xff2F6BFF)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      "Masuk ke Rentora",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 16),

                    SizedBox(
                      height: 48,
                      child: TextField(
                        cursorColor: Color(0xff94A3B8),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xff94A3B8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xff94A3B8),
                            size: 20,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xff94A3B8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xff94A3B8)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    SizedBox(
                      height: 48,
                      child: TextField(
                        obscureText: true,
                        cursorColor: Color(0xff94A3B8),
                        decoration: InputDecoration(
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(
                            color: Color(0xff94A3B8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xff94A3B8),
                            size: 20,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xff94A3B8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xff94A3B8)),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            "Lupa Kata Sandi?",
                            style: TextStyle(
                              color: Color(0xff1D4ED8),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // ========================= Navigator.pushReplacement
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Masuk",
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
                        "atau masuk dengan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff94A3B8),
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
                          side: BorderSide(color: Color(0xff94A3B8)),
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
                                color: Color(0xff94A3B8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          side: BorderSide(color: Color(0xff94A3B8)),
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
                                "assets/icons/facebook_round.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                color: Color(0xff94A3B8),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun? ",
                  style: TextStyle(color: Color(0xff94A3B8)),
                ),
                GestureDetector(
                  onTap: () {
                    // ==================== Navigator.pushNamed
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Daftar sekarang",
                    style: TextStyle(
                      color: Color(0xff2563EB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffF8FAFC),
    );
  }
}
