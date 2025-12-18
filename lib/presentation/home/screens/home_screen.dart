import 'package:flutter/material.dart';
import 'package:corn_up/core/constants/constants.dart';
import 'package:corn_up/presentation/home/widgets/dashboard_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CornUp - Tableau de bord'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête
            const Text(
              'Bienvenue 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 8),
            
            const Text(
              'Analysez la santé de votre culture de maïs',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Cartes de statistiques
            const Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Analyses en cours',
                    value: '2',
                    // color: Color(0xFFFFA000),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DashboardCard(
                    title: 'Analyses terminées',
                    value: '5',
                    // color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Dernières analyses
            const Text(
              'Dernières analyses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            Expanded(
              child: ListView(
                children: [
                  _buildAnalysisItem('Analyse du 15 Nov', 'Terminée', '15/11/2024', () {
                    Navigator.pushNamed(context, AppConstants.routeResults);
                  }),
                  _buildAnalysisItem('Analyse du 10 Nov', 'En cours...', '10/11/2024', () {}),
                  _buildAnalysisItem('Analyse du 05 Nov', 'Terminée', '05/11/2024', () {
                    Navigator.pushNamed(context, AppConstants.routeResults);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstants.routeUpload);
        },
        backgroundColor: const Color(0xFF2E7D32),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAnalysisItem(String title, String status, String date, VoidCallback onTap) {
    Color statusColor = Colors.grey;
    if (status.contains('Terminée')) statusColor = Colors.green;
    if (status.contains('En cours')) statusColor = Colors.orange;

    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.analytics,
            color: Color(0xFF2E7D32),
          ),
        ),
        title: Text(title),
        subtitle: Text(
          'Statut: $status',
          style: TextStyle(color: statusColor, fontWeight: FontWeight.w500),
        ),
        trailing: Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        onTap: onTap,
      ),
    );
  }
}