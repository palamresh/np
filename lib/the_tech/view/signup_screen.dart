import 'package:flutter/material.dart';
import 'package:np/the_tech/utils/utils.dart';
import 'package:np/the_tech/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/components/rounds_button.dart';
import '../utils/routes/routes_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: "Email",
                  labelText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  labelText: "Password"),
            ),
            SizedBox(
              height: 15,
            ),
            RoundsButton(
              title: "SignUp",
              loading: authProvider.registerLoading,
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.toastMessage("please enter your email");
                } else if (passwordController.text.isEmpty) {
                  Utils.toastMessage("please enter your password");
                } else if (passwordController.text.length < 6) {
                  Utils.toastMessage("please enter 6 digi");
                } else {
                  Map data = {
                    "email": "eve.holt@reqres.in",
                    'password': "pistol"
                  };
                  authProvider.registerApi(data, context);
                  print('api is hit');
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.login, (routes) => false);
                },
                child: Text("All ready have a account --> Login"))
          ]),
        ),
      ),
    );
  }
}
