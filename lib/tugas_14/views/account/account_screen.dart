import 'package:flutter/material.dart';
import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:flutter/services.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApiColor.background,
      appBar: AppBar(
        title: const Text(
          'Akun',
          style: TextStyle(
            color: ApiColor.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: ApiColor.textPrimary,
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ApiColor.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: ApiColor.primary,
                  child: Icon(
                    Icons.person,
                    size: 38,
                    color: ApiColor.textPrimary,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Guest User',
                  style: TextStyle(
                    color: ApiColor.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
