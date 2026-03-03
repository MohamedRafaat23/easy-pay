import 'package:easy_bay/core/utils/app_colors.dart';
import 'package:easy_bay/core/utils/validator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String hint, IconData icon, {Widget? suffix}) =>
      InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        suffixIcon: suffix,
      );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.06),

                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset("assets/images/logo.png", height: 80),
                  ),
                ),

                SizedBox(height: height * 0.03),

                const Text(
                  "Create Account! 🎉",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Sign up to start shopping",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: height * 0.04),
                const Text(
                  "Full Name",
                  style: TextStyle(fontSize: 15, color: AppColors.lightgrey),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) => v!.isEmpty ? "Name is required" : null,
                  decoration: _decoration(
                    "Enter your name",
                    Icons.person_outline,
                  ),
                ),
                SizedBox(height: height * 0.01),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 15, color: AppColors.lightgrey),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidator.validateEmail,
                  decoration: _decoration(
                    "Enter your email",
                    Icons.email_outlined,
                  ),
                ),

                SizedBox(height: height * 0.01),

                const Text(
                  "Password",
                  style: TextStyle(fontSize: 15, color: AppColors.lightgrey),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: !passwordVisible,
                  validator: AppValidator.validatePassword,
                  decoration: _decoration(
                    "Enter your password",
                    Icons.lock_outline,
                    suffix: IconButton(
                      onPressed: () =>
                          setState(() => passwordVisible = !passwordVisible),
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: AppColors.white.withOpacity(0.8)),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
