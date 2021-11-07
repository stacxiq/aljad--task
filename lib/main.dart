import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test1/data_layer/repositories/authentication.dart';
import 'package:test1/data_layer/services/network.dart';
import 'package:test1/presentation/home.dart';
import 'package:test1/router.dart';
import 'package:test1/utils/constants.dart';

import 'data_layer/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox('token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: CustomRouter.generateRoute,
          initialRoute: homeRoute
          // authenticationRepository.token != null
          //      homeRoute
          //     : paginationRoute,
          ),
    );
  }
}
