import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:spa/controllers/menu_controller.dart';
import 'package:spa/pages/base/base_page.dart';
import 'package:spa/pages/forms/tabs_forms.dart';
import 'package:spa/pages/login/login.dart';
import 'package:spa/stores/address_store.dart';
import 'package:spa/stores/coordinator_store.dart';
import 'package:spa/stores/login_store.dart';
import 'package:spa/stores/medical_record_store.dart';
import 'package:spa/stores/page_store.dart';
import 'package:spa/stores/patient_store.dart';
import 'package:spa/stores/scheduling_store.dart';
import 'package:spa/stores/supervisor_store.dart';
import 'package:spa/stores/trainee_store.dart';
import 'package:spa/stores/user_manager_store.dart';
import 'package:spa/stores/util_store.dart';
import 'package:spa/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
  //initializeDateFormatting().then((_) => runApp(const MyApp()));
}

void setupLocators() {
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(LoginStore());
  GetIt.I.registerSingleton(SchedulingStore());
  GetIt.I.registerSingleton(UtilStore());
  GetIt.I.registerSingleton(CoordinatorStore());
  GetIt.I.registerSingleton(PatientStore());
  GetIt.I.registerSingleton(SupervisorStore());
  GetIt.I.registerSingleton(TraineeStore());
  GetIt.I.registerSingleton(MedicalRecordStore());
  GetIt.I.registerSingleton(AddressStore());
  GetIt.I.registerSingleton(PageStore());
}

/*
---- TI ACCOUNT BACK4APP ----
Future<void> initializeParse() async {
  const appId = 'B4s38dFPwW1xnDAekmr0rY6LMcqNuYqRruhxdmUK';
  const clientKey = 'fozK8BZyh7oY37AozCzC4dqXpPWG3FW75Cg3oEOL';
  const serverURL = 'https://parseapi.back4app.com/';
  const liveQueryUrl = 'https://spa.b4a.io/';

  await Parse().initialize(
    appId,
    serverURL,
    clientKey: clientKey,
    liveQueryUrl: liveQueryUrl,
    autoSendSessionId: true,
    debug: true,
  );
}
*/

Future<void> initializeParse() async {
  const appId = 'YLsbmnyq9CsuReNP7ahjvXdRnpsmw5LEYknvdc3f';
  const clientKey = 'lm1aCVJxkQrnY7UcZe3LdeBHEHHxYR7mmnZflT8S';
  const serverURL = 'https://parseapi.back4app.com/';
  //const liveQueryUrl = 'https://spa.b4a.io/';

  await Parse().initialize(
    appId,
    serverURL,
    clientKey: clientKey,
    //liveQueryUrl: liveQueryUrl,
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final UserManagerStore _userManagerStore = GetIt.I<UserManagerStore>();

    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'SPA',
      theme: AppTheme.lightTheme,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ], child: const BasePage()),
    );
  }
}
