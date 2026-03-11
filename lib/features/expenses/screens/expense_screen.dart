import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/expense_service.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  final ExpenseService expenseService = ExpenseService();

  String selectedCategory = "Otros";
  final List<String> categories = [
    "Alimentos", 
    "Transporte", 
    "Entretenimiento", 
    "Maquillaje",
    "Ropa",
    "Salud",
    "Otros"
    ];

  Future<void> saveExpense() async {
    final amount = double.parse(amountController.text);

    await expenseService.addExpense(
      amount: amount,
      category: selectedCategory,
      description: descriptionController.text,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar gasto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Monto"),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              items: categories.map((category){
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Categoría"
                ),
              ),
              const SizedBox(height: 20),
            TextField(
              controller: descriptionController,  
              decoration: const InputDecoration(labelText: "Descripción"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: saveExpense,
              child: const Text("Guardar gasto"),
            )
          ],
        ),
      ),
    );
  }
}