import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/expenses/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://llsjyicsvobkmqhqhumh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxsc2p5aWNzdm9ia21xaHFodW1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMxOTM5ODUsImV4cCI6MjA4ODc2OTk4NX0.4m2PoM67PUDZD2XJKLwg2VdE6ehHZUTyxNlXR4nlFRU',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}