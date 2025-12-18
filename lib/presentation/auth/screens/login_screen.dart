import 'package:flutter/material.dart';
import 'package:corn_up/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D32).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.eco,
                  size: 60,
                  color: Color(0xFF2E7D32),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Titre
              const Text(
                'CornUp',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              
              const SizedBox(height: 8),
              
              const Text(
                'Votre expert en santé du maïs',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Boutons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppConstants.routeHome);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    ),
                  ),
                  child: const Text(
                    'Se Connecter',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppConstants.routeHome);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    ),
                    side: const BorderSide(color: Color(0xFF2E7D32)),
                  ),
                  child: const Text(
                    'Créer un Compte',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}