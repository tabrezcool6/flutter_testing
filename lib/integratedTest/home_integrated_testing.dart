import 'package:counter_widget_testing/common/custom_button.dart';
import 'package:flutter/material.dart';

class HomeLoginIntegratedTest extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  HomeLoginIntegratedTest({super.key});
  _loginOnPressed(context) {
    if (formKey.currentState!.validate()) {
      // Perform login action
      final email = emailController.text;
      final password = passwordController.text;

      if (email == 'testmail' && password == 'testpassword') {
        CustomAlertDialog.show(context, 'Login Successful!');
      } else {
        // Show error message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid credentials')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login Integrated Test'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 30),
              AuthField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              AuthField(hintText: 'Password', controller: passwordController),
              const SizedBox(height: 20),
              CustomButton(
                title: 'Sign in',
                onTap: () => _loginOnPressed(context),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
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
    );
  }
}

/// User Input Text Field for Authentication
class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  // final bool isObscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    // this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "$hintText is missing!";
      //   }
      //   return null;
      // },
      // obscureText: isObscureText,
    );
  }
}
