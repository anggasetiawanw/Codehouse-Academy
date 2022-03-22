import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/shared/theme.dart';
import 'package:tugas_minggu4/widget/textformfields.dart';

import '../widget/custom_button.dart';
import '../widget/footer.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username = "";
  String email = "";
  String password = "";
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  void saveData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      username = controllerUsername.text;
      email = controllerEmail.text;
      password = controllerPassword.text;
      sharedPreferences.setString("username", username);
      sharedPreferences.setString("email", email);
      sharedPreferences.setString("password", password);
      controllerUsername.clear();
      controllerEmail.clear();
      controllerPassword.clear();
      Navigator.pushReplacementNamed(context, '/main-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
        title: Text(
          'Sign Up',
          style: textStyle1.copyWith(fontSize: 18),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register to create an account ',
                style: textStyle5.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 28,
              ),
              TextFormFields(
                text: "Username",
                controller: controllerUsername,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormFields(
                text: "Email",
                controller: controllerEmail,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormFields(
                text: "Password",
                obscure: true,
                controller: controllerPassword,
              ),
              CustomButton(
                  onPressed: () {
                    saveData();
                  },
                  title: "Sign Up"),
                  const Spacer(),
              Footer(
                title: "Already have an account?",
                buttonTitle: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, 'sign-in');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
