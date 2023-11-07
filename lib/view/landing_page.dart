// @author yasuy0shi <yasuy0shi@icloud.com>

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends ConsumerState<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 200,
              height: 200,
              child: Placeholder(),
            ),
            Text(
              'Flutter VIPER',
              key: const ValueKey('LandingPageTitle'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              key: const ValueKey('SignInButton'),
              onPressed: () {
                Navigator.of(context).pushNamed('/sign_in');
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.montserrat(
                  color: Theme.of(context).colorScheme.background
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'PC',
                style: GoogleFonts.montserrat(
                  color: Theme.of(context).colorScheme.background
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
