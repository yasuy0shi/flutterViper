import 'package:flutter/material.dart';
import 'package:flutterViper/view/components/my_page_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends ConsumerState<MyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            key: const ValueKey('OpenDrawer'),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          title: const Text(
            'My Page',
            key: ValueKey('MyPageTitle'),
          ),
          elevation: 0,
        ),
        drawerEdgeDragWidth: 0, // ボタンのみでドロワーを開く（スワイプではドロワーを開かない）
        drawer: const MyPageDrawer(),
      ),
    );
  }
}
