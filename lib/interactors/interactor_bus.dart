import 'dart:collection';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

/// Interactorに渡すリクエストを解釈し、対応するレスポンスを返却するBus
/// Singletonパターンを採用している
class InteractorBus {
  static final HashMap<Type, dynamic> _interactors = HashMap();
  static final InteractorBus _bus = InteractorBus._();

  /// ファクトリコンストラクタ
  factory InteractorBus() {
    return _bus;
  }

  /// プライベートコンストラクタ
  InteractorBus._();

  /// Interactorを登録する
  void register<T>(dynamic interactor) {
    _interactors[T] = interactor;
  }

  /// リクエストを解釈し、対応するInteractorを実行しレスポンスを返却する
  Future<dynamic> handle(dynamic request) {
    // TODO: 引数と返り値をdynamic型ではなく厳密に定義する
    if (!_interactors.containsKey(request.runtimeType)) {
      throw DataHandlingException(message: '引数のRequestに対応するInteractorが登録されていません');
    }
    return _interactors[request.runtimeType].invoke(request);
  }
}
