import 'package:kiwi/kiwi.dart';
import 'package:pokeflutter/src/injector/injector_interface.dart';

class AppInjector implements IInjector {
  final KiwiContainer _kiwi = KiwiContainer();

  @override
  T get<T>() => _kiwi.resolve<T>();

  @override
  void registerFactory<T>(T Function() function) {
    _kiwi.registerFactory<T>((_) => function.call());
  }

  @override
  void registerSingleton<T>(T instance) {
    _kiwi.registerSingleton<T>((_) => instance);
  }

  @override
  void unregister<T>() {
    _kiwi.unregister<T>();
  }
}
