import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:preferencias_usuario_app/src/pages/setting_page.dart';
import 'package:preferencias_usuario_app/src/shared_prefs/pref_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (context) => HomePage(),
        SettingsPage.routeName : (context) => SettingsPage(),
      },
    );
  }
}