import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_boilerplate_flutter/provider/user_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (userProvider.error != null) {
          return Center(child: Text('Error: ${userProvider.error}'));
        }
        if (userProvider.users.isEmpty) {
          return const Center(child: Text('No users found.'));
        }
        return ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (context, index) {
            final user = userProvider.users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
            );
          },
        );
      },
    );
  }
}
