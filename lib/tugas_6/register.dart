import 'package:belajar_flutter/tugas_6/home.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      "Daftar ke Rentora",
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

                    SizedBox(height: 8),

                    SizedBox(
                      height: 48,
                      child: TextField(
                        obscureText: true,
                        cursorColor: Color(0xff94A3B8),
                        decoration: InputDecoration(
                          hintText: "Nomor Telepon",
                          hintStyle: TextStyle(
                            color: Color(0xff94A3B8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
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

                    SizedBox(height: 16),

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
                  "Sudah punya akun? ",
                  style: TextStyle(color: Color(0xff94A3B8)),
                ),
                GestureDetector(
                  onTap: () {
                    // ==================== Navigator.pushNamed
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Login sekarang",
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
