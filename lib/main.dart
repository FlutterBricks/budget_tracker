import 'package:budget_tracker/model/transaction_item.dart';
import 'package:budget_tracker/screens/home.dart';
import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/view_model/budget_view_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localStorageService = LocalStorageService();
  await localStorageService.initializeHive();
  final sharedPreferences = await SharedPreferences.getInstance();

  return runApp(
    DevicePreview(
      //
      enabled: false,
      builder: (context) => MyApp(
        sharedPreferences: sharedPreferences,
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({required this.sharedPreferences, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(
            create: (_) => ThemeService(sharedPreferences)),
        ChangeNotifierProvider<BudgetViewModel>(
          create: (_) => BudgetViewModel(),
        ),
      ],
      child: Builder(builder: (context) {
        final themeService = Provider.of<ThemeService>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness:
                    themeService.darkTheme ? Brightness.dark : Brightness.light,
                seedColor: Colors.indigo),
          ),
          home: Home(),
        );
      }),
    );
  }
}
