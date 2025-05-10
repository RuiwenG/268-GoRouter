import 'package:flutter/foundation.dart';
import '../bloc/authentication_bloc.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier(AuthenticationBloc bloc) {
    bloc.stream.listen((_) {
      notifyListeners(); // 状态变化时刷新
    });
  }
}
