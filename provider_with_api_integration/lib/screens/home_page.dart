import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_boilerplate_flutter/controller/api_controller.dart';
import 'package:provider_boilerplate_flutter/provider/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Integration with Provider'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return HomeBody();
        },
      ),
    );
  }
}
