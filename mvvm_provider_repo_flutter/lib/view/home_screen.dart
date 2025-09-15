import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference=Provider.of<UserViewModel>(context);
    return  Scaffold(
        body: SafeArea(
          child: Column(children: [
                InkWell(
          onTap: () {
                userPreference.remove().then((value)
                {
                Navigator.pushNamed(context, RoutesName.login);
                });
          },
          
          child: Text("Logout")),
                
                
            
          ],),
        ),
      
    );
  }
}