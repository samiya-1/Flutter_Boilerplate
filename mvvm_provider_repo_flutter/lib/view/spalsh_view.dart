import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/view_model/services/splash_services.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  SplashServices splashservices=SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash Screen",style: Theme.of(context).textTheme.headlineMedium,),),
    );
  }
}