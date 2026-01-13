import 'package:flutter/material.dart';
import '../services/prefs_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль'), backgroundColor: Colors.deepOrange),
      body: FutureBuilder(
        future: Future.wait([PrefsService.getName(), PrefsService.getEmail()]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final name = snapshot.data![0] ?? '-';
          final email = snapshot.data![1] ?? '-';

          if (name == '-' && email == '-') {
            return const Center(
              child: Text(
                'Профиль не заполнен.\nСохраните имя и email для персональных рекомендаций товаров!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Имя пользователя:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(name, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                const Text('Email для уведомлений:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(email, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 32),
                const Text(
                  'Персональные рекомендации товаров появятся здесь после заполнения профиля.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Назад'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
