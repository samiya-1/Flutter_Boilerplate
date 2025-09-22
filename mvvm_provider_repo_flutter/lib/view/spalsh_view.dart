import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/view_model/services/splash_services.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  SplashServices splashservices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashservices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Center(
        child: Text("Getting Started",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
      
    );
  }
}
