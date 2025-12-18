import 'package:flutter/material.dart';
import 'package:corn_up/core/constants/constants.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats d\'Analyse'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête de l'analyse
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Analyse #CORNU-001',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Terminée',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '15/11/2024',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Titre résultats
            const Text(
              '📊 Résultats de l\'analyse',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Graphique des maladies (placeholder)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Répartition des maladies',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.pie_chart, color: Color(0xFF2E7D32)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildDiseaseIndicator('Rouille du maïs', '25%', Colors.orange),
                    _buildDiseaseIndicator('Helminthe', '15%', Colors.red),
                    _buildDiseaseIndicator('Charbon', '5%', Colors.brown),
                    _buildDiseaseIndicator('Sain', '55%', Colors.green),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Recommandations
            const Text(
              '💡 Recommandations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRecommendation(
                      'Traitement contre la rouille',
                      'Appliquez un fongicide à base de triazole dès que possible.',
                    ),
                    const SizedBox(height: 12),
                    _buildRecommendation(
                      'Surveillance renforcée',
                      'Inspectez les zones à risque chaque semaine.',
                    ),
                    const SizedBox(height: 12),
                    _buildRecommendation(
                      'Fertilisation équilibrée',
                      'Évitez les excès d\'azote qui favorisent la rouille.',
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Bouton d'action
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Retour au tableau de bord'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiseaseIndicator(String disease, String percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              disease,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: Color(0xFF2E7D32),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}