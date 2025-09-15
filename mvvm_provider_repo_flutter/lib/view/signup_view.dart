import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/res/components/round_button.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/utils/utils.dart';
import 'package:mvvm_provider_repo_flutter/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  ValueNotifier obscurePassword = ValueNotifier(
    true,
  ); //on/off visibility of password

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<AuthViewmodel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onFieldSubmitted: (value) {
                Utils.focusChange(context, emailFocus, passwordFocus);
                //FocusScope.of(context).requestFocus(passwordFocus);   //on clicking done after typing email should goto password field ---normal method
              },
            ),

            ValueListenableBuilder(
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocus,

                  obscureText: obscurePassword.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                      child:
                          obscurePassword.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                    ),
                  ),
                );
              },
              valueListenable: obscurePassword,
            ),

            SizedBox(height: height * .085),
            RoundButton(
              title: "Sign Up",
              loading: authviewmodel.signuploading,
              onpress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("email is empty", context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("password is empty", context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                    "password should be atleast 6 digits",
                    context,
                  );
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString(),
                  };
                  authviewmodel.signupApi(data, context);
                  print("Api hit");
                }
              },
            ),
            SizedBox(height: height * .02),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },

              child: Text("Already have an Account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
