import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/widget/custom_button.dart';
import 'package:tugas_minggu4/widget/footer.dart';

import '../shared/theme.dart';
import '../widget/textformfields.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username = "";
  String password = "";
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  late SharedPreferences sharedPreferences;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if(sharedPreferences.getString("username") == null) {
        username = "";
      } else {
        username = sharedPreferences.getString("username")!;
      }
      if(sharedPreferences.getString("password") == null) {
        password = "";
      } else {
        password = sharedPreferences.getString("password")!;
      }
      print(username);
      print(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Log In',
          style: textStyle1.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign In to continue',
          style: textStyle5.copyWith(fontSize: 14),
        ),
      ]);
    }

    Widget body() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 28),
            child: TextFormFields(
              text: "Username",
              controller: controllerUsername,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: TextFormFields(
              text: "Password",
              obscure: true,
              controller: controllerPassword,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              body(),
              CustomButton(
                  onPressed: () {
                    if(username.isEmpty && password.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Harap Register dulu",
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                    else if (username == controllerUsername.text &&
                        password == controllerPassword.text) {
                      Navigator.pushReplacementNamed(context, '/main-page');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Username or Password is wrong",
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  title: "Login"),
              const Spacer(),
              Footer(
                title: "Don't have an account?",
                buttonTitle: "Sign Up",
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
