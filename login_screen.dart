import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'recovery_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Ключ для керування формою та валідацією
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form( // Додано обгортку Form
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Вимога: використання віджета Image
                Image.network(
                  'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100),
                ),
                const SizedBox(height: 48),
                TextFormField( // Замінено TextField на TextFormField
                  decoration: const InputDecoration(
                    labelText: 'Логін',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => value!.isEmpty ? 'Введіть логін' : null, // Валідація
                ),
                const SizedBox(height: 16),
                TextFormField( // Замінено TextField на TextFormField
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) => value!.isEmpty ? 'Введіть пароль' : null, // Валідація
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Запуск валідації перед виконанням логіки
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return const AlertDialog(
                            title: Text('Message'),
                            content: Text("Need to implement login logic"),
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded( // Щоб кнопки гарно ділили простір
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text("Sign up"),
                      ),
                    ),
                    const SizedBox(width: 16), // Відступ між кнопками
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RecoveryScreen(),
                            ),
                          );
                        },
                        child: const Text("Forgot Password?"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}