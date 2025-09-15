import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/view_model/auth_viewmodel.dart';
import 'package:mvvm_provider_repo_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
ChangeNotifierProvider(create: (_)=>AuthViewmodel()),
ChangeNotifierProvider(create: (_)=>UserViewModel()),

    ],
    child: MaterialApp(
     // title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
initialRoute: RoutesName.splashScreen,
onGenerateRoute: Routes.generateRoute ,
  ),);
  }
}