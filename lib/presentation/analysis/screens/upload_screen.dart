import 'package:flutter/material.dart';
import 'package:corn_up/core/constants/constants.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Analyse'),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône illustrative
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.video_library,
                size: 80,
                color: Color(0xFF2E7D32),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Titre
            const Text(
              'Analyser mon champ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 16),
            
            const Text(
              'Téléversez une vidéo de drone de votre champ de maïs pour obtenir une analyse détaillée des maladies.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            
            const SizedBox(height: 48),
            
            // Bouton d'upload (placeholder)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showPlaceholderDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload),
                    SizedBox(width: 8),
                    Text(
                      'Sélectionner une Vidéo',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Instructions
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📋 Instructions :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('• Vidéo de 30 secondes maximum'),
                    SizedBox(height: 4),
                    Text('• Prise en plein jour'),
                    SizedBox(height: 4),
                    Text('• Hauteur de vol : 10-20m'),
                    SizedBox(height: 4),
                    Text('• Champ bien visible'),
                    SizedBox(height: 4),
                    Text('• Format MP4 ou MOV recommandé'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPlaceholderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fonctionnalité à venir'),
        content: const Text('La sélection de vidéo sera implémentée la semaine 2 avec l\'intégration Firebase Storage.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}