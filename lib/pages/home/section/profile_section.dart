import 'package:flutter/material.dart';
import 'package:mindmate/controller/auth_controller.dart';
import 'package:mindmate/pages/auth/login_page.dart';

import '../../../util/custom_info_tile.dart';
import '../../../util/reusable_profile_option.dart';

class ProfileSection extends StatelessWidget {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 239, 149, 53),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  ReUsableProfileOption(
                    icon: Icons.edit,                    
                    title: 'Edit Profile',
                    onTap: () async {
                      // open dialog to edit
                      await showDialog(
                        context: context,
                        builder: (_) =>
                            EditProfileDialog(context, authController),
                      );
                    },
                  ),
                  ReUsableProfileOption(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (_) =>
                            ChangePasswordDialog(context, authController),
                      );
                    },
                  ),
                  ReUsableProfileOption(
                    icon: Icons.logout,
                    title: 'Log Out',
                    onTap: () async {
                      await authController.logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget EditProfileDialog(
    BuildContext context,
    AuthController authController,
  ) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    bool loading = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: loading
                  ? null
                  : () async {
                      final name = nameController.text.trim();
                      final email = emailController.text.trim();
                      if (name.isEmpty || email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("All fields are required"),
                          ),
                        );
                        return;
                      }
                      setState(() => loading = true);
                      try {
                        final res = await authController.updateProfile(
                          name,
                          email,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(res['message'] ?? 'Profile updated'),
                          ),
                        );
                        if (res['user'] != null) Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Error: $e")));
                      }
                      setState(() => loading = false);
                    },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Widget ChangePasswordDialog(
    BuildContext context,
    AuthController authController,
  ) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    bool loading = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: oldPasswordController,
                decoration: const InputDecoration(labelText: "Old Password"),
                obscureText: true,
              ),
              TextField(
                controller: newPasswordController,
                decoration: const InputDecoration(labelText: "New Password"),
                obscureText: true,
              ),
              TextField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: "Confirm New Password",
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: loading
                  ? null
                  : () async {
                      final oldPass = oldPasswordController.text.trim();
                      final newPass = newPasswordController.text.trim();
                      final confirmPass = confirmPasswordController.text.trim();

                      if (oldPass.isEmpty ||
                          newPass.isEmpty ||
                          confirmPass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("All fields are required"),
                          ),
                        );
                        return;
                      }
                      if (newPass != confirmPass) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("New passwords do not match"),
                          ),
                        );
                        return;
                      }

                      setState(() => loading = true);
                      try {
                        final res = await authController.changePassword(
                          oldPass,
                          newPass,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(res['message'] ?? 'Password changed'),
                          ),
                        );
                        if (res['message'] != null) Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Error: $e")));
                      }
                      setState(() => loading = false);
                    },
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text("Change"),
            ),
          ],
        );
      },
    );
  }
}
