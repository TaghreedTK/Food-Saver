import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/core/Di.dart' as di;
import 'package:food_saver/core/Sh.dart';

import 'app.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await di.sl<MySharedPrefInterface>().initSP();
  print(di.sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken));
  Bloc.observer = MyBlocObserver();
  runApp(
    const App(),
  );
}




  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".




