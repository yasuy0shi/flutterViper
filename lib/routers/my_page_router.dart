import 'package:flutterViper/main.dart';
import 'package:flutterViper/routers/router.dart';

/// マイページへ遷移するRouter
class MyPageRouter implements Router {
  @override
  Future<void> go() async {
    navigatorKey.currentState?.pushNamed('/my');
  }
}
