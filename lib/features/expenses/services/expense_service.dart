import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseService {
  final supabase = Supabase.instance.client;

  Future<void> addExpense({
    required double amount,
    required String category,
    required String description,
  }) async {
    await supabase.from('expenses').insert({
      'amount': amount,
      'category': category,
      'description': description,
    });
  }

  Future<List<Map<String, dynamic>>> getExpenses() async {
    final response = await supabase
    .from('expenses')
    .select()
    .order('createdAt', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }
}