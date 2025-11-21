import 'package:flutter/material.dart';
import 'package:corn_up/presentation/home/widgets/dashboard_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            DashboardCard(title: 'Analyses en attente', value: '3'),
            SizedBox(height: 12),
            DashboardCard(title: 'Dernier résultat', value: 'OK'),
          ],
        ),
      ),
    );
  }
}
