import 'package:auto_injector/auto_injector.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/firebase_auth_repository.dart';


abstract class Injector{
  T get<T extends Object>();
  void replace<T extends Object>(T instance);
}

class _GetItImpl implements Injector{

  _GetItImpl(){
    _register();
  }

  void _register(){
    GetIt.I.registerLazySingleton(() => FirebaseAuthRepository());
  }

  @override
  T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    GetIt.I.unregister();
    GetIt.I.registerSingleton(instance);
  }
}

class _AutoInjectImpl implements Injector{
  final injector = AutoInjector();

  _AutoInjectImpl(){
    _register();
  }

  void _register(){
    injector.addLazySingleton<FirebaseAuthRepository>(FirebaseAuthRepository.new);
    injector.commit();
  }

  @override
  T get<T extends Object>() {
    return injector.get<T>();
  }

  @override
  void replace<T extends Object>(T instance) {
    injector.replaceInstance<T>(instance);
  }
}

class _MyInjector implements Injector{

  final _map = <Type,Object>{};

  _MyInjector(){
    _register();
  }

  void _register(){
    _map[FirebaseAuthRepository] = FirebaseAuthRepository();
  }

  @override
  T get<T extends Object>() {
    return _map[T] as T;
  }

  @override
  void replace<T extends Object>(T instance) {
    _map[T] = instance;
  }

}
// final Injector injector = _AutoInjectImpl();
final Injector injector = _GetItImpl();

final _injector = AutoInjector(
  on: (i){
    i.add<FirebaseAuthRepository>(FirebaseAuthRepository.new);
    i.commit();
  }
);

