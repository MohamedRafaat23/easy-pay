import 'package:easy_bay/core/utils/app_colors.dart';
import 'package:easy_bay/core/utils/validator.dart';
import 'package:easy_bay/features/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
                SizedBox(height: height * 0.08),
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
                // ✅ Welcome Text
                const Text(
                  "Welcome Back! 👋",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Sign in to continue shopping",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.lightgrey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TextFormField(
                      validator: AppValidator.validateEmail,
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Enter your email",
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.lightgrey,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      validator: AppValidator.validatePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: "Enter your password",
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                            () => passwordVisible = !passwordVisible,
                          ),
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            // TODO: handle login
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: const Text(
                          "Sign Up",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
