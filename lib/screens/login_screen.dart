import 'package:flutter/material.dart';
import 'package:kanban/screens/kanban_board_screen.dart';
import 'package:kanban/theme/app_theme.dart';
import 'package:kanban/widgets/primary_button.dart';
import 'package:kanban/widgets/rounded_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String _validusername = 'admin';
  static const String _validpassword = 'pass';

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _obscurepassword = true;
  bool _invalidlogin = false;

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void login() {
    final username = _usernamecontroller.text.trim();
    final password = _passwordcontroller.text;

    if (username == _validusername && password == _validpassword) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => KanbanBoardScreen(username: username),
        ),
      );
    } else {
      setState(() => _invalidlogin = true);
    }
  }

  void togglepasswordvisibility() {
    setState(() => _obscurepassword = !_obscurepassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              buildlogo(),
              const SizedBox(height: 24),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              RoundedTextField(
                controller: _usernamecontroller,
                hint: 'Username',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 14),
              RoundedTextField(
                controller: _passwordcontroller,
                hint: 'Password',
                icon: Icons.lock_outline,
                obscuretext: _obscurepassword,
                suffix: IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    _obscurepassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey[600],
                  ),
                  onPressed: togglepasswordvisibility,
                ),
              ),
              if (_invalidlogin) ...[
                const SizedBox(height: 12),
                const Text(
                  'Invalid username or password',
                  style: TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ],
              const SizedBox(height: 28),
              PrimaryButton(text: 'Sign In', onpressed: login),
              const Spacer(flex: 3),
              const Text(
                'Copyright 2026',
                style: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildlogo() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: 30,
            spreadRadius: 4,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(
        Icons.storefront_outlined,
        color: Colors.white,
        size: 44,
      ),
    );
  }
}
