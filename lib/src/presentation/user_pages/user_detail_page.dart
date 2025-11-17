import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/user/entities/user.dart';
import 'user_form_page.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget {
  static const String routeName = '/user/:id';
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First name: ${user.firstName ?? ''}'),
            const SizedBox(height: 8),
            Text('Last name: ${user.lastName ?? ''}'),
            const SizedBox(height: 8),
            Text('Email: ${user.email ?? ''}'),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Edit'),
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UserFormPage(user: user)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
