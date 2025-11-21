# CornUp - MVP

**Version :** 1.0
**Objectif :** Développer en 4 semaines un Produit Minimum Viable (MVP) d'une application Flutter d'aide aux cultivateurs de maïs.

## 1. Vue d'Ensemble du Projet

Ce projet vise à créer une application mobile permettant à un agriculteur de téléverser une vidéo de son champ prise par un drone. Cette vidéo est ensuite analysée par une pipeline de modèles d'IA pour détecter trois maladies courantes du maïs. L'application affiche un rapport de diagnostic et des recommandations.

**Stack Technique :**
*   **Frontend Mobile :** Flutter
*   **Backend :** Python (FastAPI) sur Google Cloud Run
*   **Base de Données :** Firebase Firestore
*   **Stockage de Fichiers :** Firebase Storage
*   **Traitement Asynchrone :** Google Cloud Pub/Sub
*   **Déploiement IA :** Google Vertex AI

## 2. Architecture Globale

Le système est découpé en trois grands blocs qui communiquent de manière asynchrone :

```
[Application Flutter] ---> (Téléverse vidéo) ---> [Firebase Storage]
       |                                                 |
(Écrit/Lit données)                                      | (Déclenche)
       |                                                 V
[Firebase Firestore] <--- (Écrit résultats) --- [Cloud Run (Python)] <--- [Pub/Sub]
       ^                                                 |
       |                                                 | (Appelle)
       |_________________________________________________V
                                                   [Vertex AI]
```

## 3. Structure du Projet Flutter

Le code Flutter est organisé en 3 couches principales pour faciliter la collaboration et la maintenance :

-   **`lib/data`**: Responsable de la récupération des données. Contient les implémentations concrètes pour communiquer avec Firebase (Firestore, Storage, Auth).
-   **`lib/domain`**: Le cœur de l'application. Contient la logique métier et les contrats (interfaces) que la couche `data` doit implémenter. Il ne dépend d'aucun framework.
-   **`lib/presentation`**: La couche UI. Contient tous les écrans, les widgets et la logique de gestion d'état (avec Riverpod).

## 4. Pour Commencer

1.  Clonez le dépôt : `git clone [URL_DU_REPO]`
2.  Assurez-vous d'avoir Flutter installé.
3.  Installez les dépendances : `flutter pub get`
4.  Configurez Firebase pour le projet Flutter. Le fichier `firebase_options.dart` sera nécessaire (généré via la CLI de Firebase).

## 5. Plan de Développement & Répartition des Tâches (MVP - 4 Semaines)

L'équipe est composée de 3 développeurs polyvalents. Les tâches sont réparties pour maximiser le travail en parallèle et minimiser les blocages.

---

### **Semaine 1 : Fondations et Risques Majeurs**
**Objectif : Mettre en place l'infrastructure et l'UI de base.**

*   **Développeur 1 (Focus Cloud/Infra) :**
    *   [ ] Créer le projet Firebase/GCP.
    *   [ ] Déployer les 2 modèles d'IA sur Vertex AI et obtenir les URL des endpoints.
    *   [ ] Configurer Storage, Firestore (avec règles de sécurité de base) et Pub/Sub.
    *   [ ] Fournir le fichier de configuration `firebase_options.dart` à l'équipe.
    *   **Livrable :** Une infrastructure cloud fonctionnelle et les clés/configs pour l'équipe.

*   **Développeur 2 (Focus UI/Structure) :**
    *   [ ] Créer la structure de base des 4 écrans (Auth, Home, Upload, Results) avec une UI factice (placeholders).
    *   [ ] Mettre en place la navigation entre les écrans.
    *   [ ] Définir le thème de l'application (`lib/core/theme`).
    *   **Livrable :** Une application "cliquable" mais sans logique.

*   **Développeur 3 (Focus Auth/État) :**
    *   [ ] Intégrer Firebase Auth.
    *   [ ] Développer la logique d'inscription et de connexion sur l'écran d'authentification.
    *   [ ] Mettre en place le provider Riverpod principal pour gérer l'état de l'utilisateur (connecté/déconnecté).
    *   **Livrable :** Un flux d'authentification fonctionnel.

**Point d'intégration de fin de semaine :** Fusionner l'UI de base (Dev 2) avec la logique d'authentification (Dev 3) en utilisant la configuration Firebase fournie par le Dev 1.

---

### **Semaine 2 : Connexion Frontend-Backend**
**Objectif : Permettre le téléversement et le déclenchement de l'analyse.**

*   **Développeur 1 (Focus Backend) :**
    *   [ ] Développer le service Cloud Run (FastAPI) qui écoute Pub/Sub.
    *   [ ] Implémenter la logique de récupération de la vidéo depuis Storage et l'extraction des images (OpenCV).
    *   [ ] Définir la structure de données finale pour les documents dans la collection `analyses` de Firestore.
    *   **Livrable :** Un service backend déployé qui se déclenche et traite une vidéo (pour l'instant sans appeler l'IA).

*   **Développeur 2 (Focus Upload) :**
    *   [ ] Implémenter la sélection de vidéo depuis le téléphone.
    *   [ ] Intégrer `firebase_storage` pour téléverser la vidéo et afficher une barre de progression.
    *   [ ] Créer un document dans Firestore (`analyses/{id}`) avec le statut `en cours` au début du téléversement.
    *   **Livrable :** L'écran de téléversement est 100% fonctionnel.

*   **Développeur 3 (Focus Dashboard) :**
    *   [ ] Implémenter l'écran principal (Home) pour qu'il écoute en temps réel la collection `analyses` de Firestore.
    *   [ ] Afficher la liste des analyses de l'utilisateur avec leur statut (ex: "En cours...", "Terminé").
    *   [ ] Permettre de naviguer vers l'écran de résultats (encore factice à ce stade).
    *   **Livrable :** Un dashboard dynamique qui reflète l'état des analyses.

**Point d'intégration :** Le flux complet `Upload -> Création Firestore -> Affichage sur le Dashboard` doit fonctionner.

---

### **Semaine 3 : Affichage des Résultats**
**Objectif : Compléter la boucle, de l'upload à l'affichage du diagnostic.**

*   **Développeur 1 (Focus Backend/IA) :**
    *   [ ] Intégrer les appels aux endpoints Vertex AI dans le service Cloud Run.
    *   [ ] Finaliser la logique d'agrégation des résultats (calcul des pourcentages).
    *   [ ] S'assurer que le service met à jour le document Firestore avec le statut `terminé` et les résultats.
    *   **Livrable :** La pipeline d'analyse est complète et fonctionnelle.

*   **Développeur 2 (Focus Écran de Résultats) :**
    *   [ ] Construire l'UI de l'écran de résultats pour afficher dynamiquement les pourcentages (ex: graphiques simples).
    *   [ ] Afficher les fiches de recommandations correspondantes en fonction des maladies détectées.
    *   **Livrable :** Un écran de diagnostic clair et utile pour l'utilisateur.

*   **Développeur 3 (Focus Finalisation et Erreurs) :**
    *   [ ] Gérer les états de chargement et les erreurs sur tous les écrans (ex: échec du téléversement, analyse échouée).
    *   [ ] Créer et intégrer les widgets partagés (`shared_widgets`) pour garantir une UI cohérente.
    *   [ ] Refactoriser le code si nécessaire pour améliorer la lisibilité.
    *   **Livrable :** Une application plus robuste et une base de code plus propre.

---

### **Semaine 4 : Tests et Préparation**
**Objectif : Stabiliser l'application et préparer la démonstration.**

*   **Tâches communes (travail en trio) :**
    *   [ ] Effectuer des tests de bout en bout sur de vrais appareils.
    *   [ ] Créer un backlog de bugs et les prioriser.
    *   [ ] Corriger les bugs les plus critiques.
    *   [ ] Améliorer les performances si nécessaire (ex: compression vidéo basique avant l'upload).
    *   [ ] Préparer le scénario de démonstration du MVP.

## 6. Conventions de Code

*   **Branches Git :** Suivre le modèle `feature/[nom-de-la-feature]` (ex: `feature/auth-flow`).
*   **Pull Requests :** Chaque PR doit être relue par au moins un autre membre de l'équipe avant d'être fusionnée dans la branche principale (`main`).
*   **Style de Code :** Suivre les conventions officielles de Dart et utiliser `flutter format`.