import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/auth_service.dart';
import 'package:mindmate/pages/auth/register_page.dart';
import 'package:mindmate/pages/home/home_page.dart';
import 'package:mindmate/util/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final authService = AuthService();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0XFF088F8F),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MindMate',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mental Health Companion',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF3E5A66),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hint: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        if (!RegExp(pattern).hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      obscure: false,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hint: 'Password at least 6 characters',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscure: true,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4EB3E8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 3,
                        ),
                        onPressed: () async{
                          if (formKey.currentState!.validate()) {
                            final result = await authService.loginUser(
                              emailController.text,
                              passwordController.text,
                            );
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString("token", result["token"]);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result["message"])),
                            );

                            if (result["success"]) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
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
                Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Or continue with',
                    style: GoogleFonts.lato(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('lib/assets/google (2).png', width: 35),
                    SizedBox(width: 10),
                    Image.asset('lib/assets/insta.png', width: 35),
                    SizedBox(width: 10),
                    Image.asset('lib/assets/fb.png', width: 35),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: GoogleFonts.lato(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
