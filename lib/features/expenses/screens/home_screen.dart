import 'package:flutter/material.dart';
import 'expense_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CaTicos"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),

          const Text(
            "Total gastos de este mes",
            style: TextStyle(fontSize: 18),
          ),
          const Text(
            "\$0.00",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            "Mis gastos",
            style: TextStyle(fontSize: 20),
          ),

          const SizedBox(height: 20),
      const Center(
        child: Text(
          "Welcome to CaTicos!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    ],
  ),
  floatingActionButton: FloatingActionButton(
    onPressed:() {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => const ExpenseScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}