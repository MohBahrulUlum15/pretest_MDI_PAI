// ignore_for_file: use_build_context_synchronously

import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pandawa_agri_indo_test/data/remote/controller/controller_auth.dart';
import 'package:pandawa_agri_indo_test/ui/screens/home/home_screen.dart';
import 'package:pandawa_agri_indo_test/ui/widgets/button_primary.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;

  final authController = Get.put(ControllerAuth());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    login() async {
      if (formKey.currentState!.validate()) {
        await authController.login(
            _emailController.text, _passwordController.text);
        if (authController.successLogin) {
          DInfo.dialogSuccess(context, authController.message);
          DInfo.closeDialog(context, actionAfterClose: () {
            Get.off(() => const HomeScreenPage());
          });
        } else {
          DInfo.dialogError(context, authController.message);
          DInfo.closeDialog(context);
        }
      }
    }

    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16.h,
                  ),
                  Icon(
                    Icons.widgets_rounded,
                    size: 110.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Sign in your account to continue",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: widthSize * 0.95,
                    height: 72.h,
                    child: TextField(
                      showCursor: true,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black45,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black45,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          hintText: 'username',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6))),
                    ),
                  ),
                  SizedBox(
                    width: widthSize * 0.95,
                    height: 72.h,
                    child: TextField(
                      obscureText: !_passwordVisible,
                      cursorColor: Colors.black45,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: 'password',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // _buildLoginSection(),
                  customPrimaryButton(
                    context: context,
                    text: 'Sign in',
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary),
                    isEnabled: true,
                    width: widthSize * 0.95,
                    height: 54.h,
                    onPressed: () {
                      if (_emailController.value.text.isEmpty) {
                        DInfo.dialogError(context, 'Username can\'t be empty');
                      } else {
                        if (_passwordController.value.text.isEmpty) {
                          DInfo.dialogError(
                              context, 'Password can\'t be empty');
                        } else {
                          login();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      DInfo.dialogNetral(context, 'This feature not ready');
                      DInfo.closeDialog(context);
                    },
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      width: widthSize * 0.95,
                      height: 54.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google-icon-logo.png',
                            height: 32,
                            width: 32,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      InkWell(
                        onTap: () {
                          DInfo.dialogNetral(context, 'This feature not ready');
                          DInfo.closeDialog(context);
                        },
                        child: Text(
                          "Click here",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
