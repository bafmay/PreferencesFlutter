
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }
  
  get colorSecundario{
    return _prefs.getBool('color') ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool('color', value);
  }

  get nombreUsuario{
    return _prefs.getString('nombre') ?? '';
  }

  set nombreUsuario(String value){
    _prefs.setString('nombre', value);
  }

  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }

}
