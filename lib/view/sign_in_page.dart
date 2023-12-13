// @author yasuy0shi <yasuy0shi@icoud.com>

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutterViper/presenters/authentication/authentication_presenter.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ConsumerState<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthenticationPresenter authenticationPresenter;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationPresenter =
        ref.read(AuthenticationPresenterProvider.presenter.notifier);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Sign In',
          key: const ValueKey('SignInPageTitle'),
          style: GoogleFonts.montserrat(
            color: Theme.of(context).colorScheme.background
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              key: const ValueKey('EmailFormField'),
              controller: emailController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: 'Email'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey('PasswordFormField'),
              controller: passwordController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: 'Password'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: const ValueKey('SignInButton'),
              onPressed: () {
                authenticationPresenter.signIn(emailController.text, passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite),
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
