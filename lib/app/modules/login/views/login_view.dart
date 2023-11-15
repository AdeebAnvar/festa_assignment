import 'package:festa_assignment/app/widgets/custom_textfield.dart';
import 'package:festa_assignment/cores/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 100, 89),
      body: isMobile(context)
          ? MobilLoginUI(
              onLoginPressed: () => controller.onLogin(),
            )
          : WebLoginUI(
              onLoginPressed: () => controller.onLogin(),
            ),
    );
  }
}

class MobilLoginUI extends StatelessWidget {
  const MobilLoginUI({
    super.key,
    required this.onLoginPressed,
  });
  final void Function()? onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      Text(
                        'Log In',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.teal[700]),
                      ),
                      CustomTextformfied(
                        hintText: 'email',
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.teal[700],
                        ),
                      ),
                      CustomTextformfied(
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.teal[700],
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: Colors.teal[700],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: onLoginPressed,
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            elevation: 0,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Sign In With Google',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WebLoginUI extends StatelessWidget {
  const WebLoginUI({
    super.key,
    required this.onLoginPressed,
  });
  final void Function()? onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.teal[700]),
                    ),
                    CustomTextformfied(
                      hintText: 'email',
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.teal[700],
                      ),
                    ),
                    CustomTextformfied(
                      hintText: 'password',
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.teal[700],
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_outlined,
                        color: Colors.teal[700],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: onLoginPressed,
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'G',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              ' Sign In With Google',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
