import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/services/hive_db.dart';
import 'package:myportfolio/src/home/home_view.dart';
import 'package:myportfolio/src/view_model/base_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  var box = await Hive.openBox('languageBox');
  print('Box opened: ${box.isOpen}');

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => BaseVM())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? storedThemeMode = await HiveDb.getThemeMode();
      Constant.themeMode = storedThemeMode;
      if (storedThemeMode == "ThemeMode.dark") {
        context.read<BaseVM>().themeMode = ThemeMode.dark;
      } else {
        context.read<BaseVM>().themeMode = ThemeMode.light;
      }
      context.read<BaseVM>().update();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaseVM>(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 450, end: 800, name: TABLET),
            const Breakpoint(start: 800, end: 1200, name: DESKTOP),
            const Breakpoint(start: 1200, end: double.infinity, name: '4K'),
          ],
          child: MaterialApp(
            builder: (context, child) {
              child = BotToastInit()(context, child);
              child = MaxWidthBox(
                maxWidth: 100.w,
                background: Container(color: R.colors.whiteColor),
                child: ResponsiveScaledBox(
                  width: ResponsiveValue<double>(
                    context,
                    defaultValue: 2000,
                    conditionalValues: [
                      Condition.equals(name: MOBILE, value: 300),
                      Condition.equals(name: TABLET, value: 600),
                      Condition.equals(name: DESKTOP, value: 800),
                      Condition.equals(name: '4K', value: 2000),
                    ],
                  ).value,
                  child: child,
                ),
              );
              return child;
            },
            debugShowCheckedModeBanner: false,
            title: 'Muhammad Umair',
            themeMode: provider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: HomeView(),
          ),
        );
      },
    );
  }
}
