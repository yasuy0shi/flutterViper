import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutterViper/presenters/authentication/authentication_presenter.dart';

class MyPageDrawer extends ConsumerWidget {
  const MyPageDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AuthenticationPresenterProvider.presenter);
    final authenticationPresenter = ref.read(AuthenticationPresenterProvider.presenter.notifier);

    return Drawer(
      key: const ValueKey('MyPageDrawer'),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              state.user?.id.toString() ?? '',
              style: const TextStyle(color: Colors.grey),
            ),
            accountName: Text(
              state.user?.name ?? '',
              style: const TextStyle(color: Colors.black),
            ),
            currentAccountPicture: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            key: const ValueKey('DrawerItem_SignOut'),
            leading: const Icon(Icons.close),
            title: const Text('Sign Out'),
            onTap: () {
              authenticationPresenter.signOut();
              Navigator.of(context).pushNamed('/landing');
            },
          ),
        ],
      ),
    );
  }
}
