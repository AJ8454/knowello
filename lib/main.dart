import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowello/utils/app_router.dart';
import 'package:knowello/utils/provider_registration.dart';
import 'package:knowello/utils/theme_data.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: registerProvider,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Knowello',
          theme: MyTheme.lightTheme,
          initialRoute: '/bottomNavBar',
          routes: appRouter,
        ),
      );
}
