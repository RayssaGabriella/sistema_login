import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String nomeUsurio;
  final String emailUsurio;

  const HomePage({super.key});
    super.key,
    required this.nomeUsuario,
    required this.nomeUsuario,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema"),
        centerTitle: true,
      ),
      body:  Center(
        child: padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const: Icon(
                icons.home,
                size:100
                ),
                const SizedBox(height: 30),

                Text(
                  nomeUsurio
                )
            ],
          )
        ),
      ),
    );
  }
}