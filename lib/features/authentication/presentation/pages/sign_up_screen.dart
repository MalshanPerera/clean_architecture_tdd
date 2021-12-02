import 'package:clean_architecture_tdd/core/helper/app_colors.dart';
import 'package:clean_architecture_tdd/core/helper/app_strings.dart' show SIGN_IN_SCREEN_ROUTE;
import 'package:clean_architecture_tdd/features/authentication/presentation/notifiers/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  void dispose() {
    _signUpFormKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
          child: Form(
            key: _signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChanged: (value) => _email = value,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  onChanged: (value) => _password = value,
                ),
                RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'At least ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: '8 symbols',
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                        TextSpan(
                          text: ',',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'one uppercase letter',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: ',',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'one number',
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                      ],
                    ),
                  ),
                ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      _signUpFormKey.currentState!.save();
                      FocusScope.of(context).unfocus();

                      // TODO: Fix First Name and Last Name
                      context.read<AuthModel>().signUp(email: _email, password: _password, firstName: 'Malshan', lastName: 'Perera');
                    }
                  },
                ),
                const Spacer(),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () => Navigator.pushReplacementNamed(context, SIGN_IN_SCREEN_ROUTE),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
