import 'package:easy_bay/core/utils/app_colors.dart';
import 'package:easy_bay/core/utils/validator.dart';
import 'package:easy_bay/features/view/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForgetPassword";

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      /// 🔹 AppBar
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Description
                Text(
                  "No worries! Enter your registered email address, and we’ll help you reset your password",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.gray,
                  ),
                ),
                  Center(child: Image.asset("assets/images/new_message.png")),
                SizedBox(height: height * 0.03),
                /// 🔹 Email
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.lightgrey,
                  ),
                ),
                const SizedBox(height: 6),

                CustomFormField(
                  controller: emailController,
                  hintText: "Enter your email",
                  validator: AppValidator.validateEmail,
                  autovalidateMode:
                   AutovalidateMode.onUserInteraction,
                  prefixIcon: const Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: height * 0.04),

                /// 🔹 Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // TODO: send reset email
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ),
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