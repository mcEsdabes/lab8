import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>(); // Ключ форми

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Реєстрація'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form( // Додано Form
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField( // TextFormField + Validator
                decoration: const InputDecoration(
                  labelText: 'Ім\'я користувача',
                ),
                validator: (value) => value!.isEmpty ? 'Введіть ім\'я' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Логін',
                ),
                validator: (value) => value!.isEmpty ? 'Введіть логін' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Пароль',
                ),
                validator: (value) => value!.isEmpty ? 'Введіть пароль' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Перевірка форми
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return const AlertDialog(
                          title: Text('Message'),
                          content: Text("Need to implement registration"),
                        );
                      },
                    );
                  }
                },
                child: const Text("Register"),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}