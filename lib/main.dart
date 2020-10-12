//import 'dart:html';

//import 'dart:html';

//import 'dart:html';

//import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app2/Big_Card.dart';
import 'package:flutter_app2/Big_Card_Tombamento.dart';
import 'package:flutter_app2/SecondRoute.dart';
import 'package:flutter_app2/Taxi_Route.dart';
import 'package:flutter_app2/main_QlikSense_Route.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'GetDataFirebase.dart';

var datamapglobal = FirebaseDatabase.instance.reference();

var irraTomb1 = "";
var irraTomb2 = "";
var nps;
var Bool_Login = false;

Future<bool> Bool_Loging(data) async {
  await for (bool x in data) {
    x = data;
    x = await Bool_Login;
    Bool_Login = x;
  }
  return Bool_Login;
}

var titulo1Tomb = "";
var titulo2Tomb = "";
String user = "bjhfbsdjkfbsjdbfsdjfh";
var labuda = "";

var setState_loja = "STZ";
var password = "";
var irra = "";
var value0;
var _loja;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF303030),
      systemNavigationBarDividerColor: Color(0xFF303030),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColorDark: Colors.black,
      ),
      title: 'Diretoria de Operações',
      theme: ThemeData(
        primaryColorDark: Colors.black,
        backgroundColor: Colors.black,
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
//    funcaoqualquer1();
    FirebaseDatabase.instance
        .reference()
        .once()
        .then((DataSnapshot STZDataSnapshot0) {
      Map<dynamic, dynamic> idiota1 = STZDataSnapshot0.value;
      idiota = idiota1;
    });

    Stream<bool> trem = Stream<bool>.value(Bool_Login);
    return new StreamBuilder(
      initialData: false,
      stream: trem,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          return new Text("Error!");
        } else if (asyncSnapshot.data == null) {
          return Container(
            child: Center(
              child: Text('Carregando....'),
            ),
          );
        } else {
          return Tela_de_entrada();
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _Tela_de_entrada extends State<Tela_de_entrada> {
  @override
  Widget build(BuildContext context) {
//    funcaoqualquer1();
    if (Bool_Login == true)
      return Scaffold(
        backgroundColor: Color(0xFF212121),
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: AppBar(
          backgroundColor: Color(0xFF303030),
          leading: null,
          automaticallyImplyLeading: true,
          title: Container(
            width: null,
            height: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LoginPopup(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Center(child: Text(setState_loja)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[],
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: null,
              verticalDirection: VerticalDirection.down,
              textBaseline: null,
              children: <Widget>[
                Container(
                  height: 26,
                  width: 130,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    onChanged: (text) {},
                    onSubmitted: (text) {
                      setState(() {
                        if (Bool_Login) {
                          _loja = text;
                          setState_loja = _loja;

                          Navigator.pop(context, Bool_Login);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Tela_de_entrada();
                          }), result: Bool_Login);

                          password = "";
                          user = "";
                        }
                      });
                    },
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        icon: Icon(
                          Icons.store,
                          color: Colors.white,
                        ),
//                        helperText: "cod. da loja, nome da loja ou 'STZ'",
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        alignLabelWithHint: false,
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: 'Enter a store',
                        labelStyle: TextStyle(color: Colors.white70),
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder()),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: <Widget>[
                    Cardjj(
                      Cardjj_title: "Vendas",
                    ),
                    Cardjj(
                      Cardjj_title: "PA",
                    ),
//                    Cardjj(
//                      Cardjj_title: "TKM",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "Aprovados",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "Ativados",
//                    ),
////                    Cardjj(
////                      Cardjj_title: "Prod. agre.",
////                    ),
////                    Cardjj(
////                      Cardjj_title: "Seguros",
////                    ),
//                    Cardjj(
//                      Cardjj_title: "Assistên.",
//                    ),
////                    Cardjj(
////                      Cardjj_title: "S. rápido",
////                    ),
////                    Cardjj(
////                      Cardjj_title: "S. produt.",
////                    ),
//                    Cardjj(
//                      Cardjj_title: "%CJ",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "%CP",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "%NPS",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "Retornos",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "%Conversão",
//                    ),
//                    Cardjj(
//                      Cardjj_title: "Entrantes",
//                    ),
//                    CardjjTomb()
                  ],
                ),
              ],
            ),
          ],
        ),
        endDrawer: _Drawer(),
      );

    if (Bool_Login == false)
      return Scaffold(
        backgroundColor: Color(0xFF212121),
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: AppBar(
          backgroundColor: Color(0xFF303030),
          leading: null,
          automaticallyImplyLeading: true,
          title: Container(
            width: null,
            height: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LoginPopup(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Center(child: Text(setState_loja)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Bem vindo ao aplicativo sem nome!!!",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Por favor, efetuar login para continuar",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
                child: Column(
              children: <Widget>[
                Text(
                  "Created by",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Hitalo",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )),
          ],
        ),
        /*    Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: null,
              verticalDirection: VerticalDirection.down,
              textBaseline: null,
              children: <Widget>[
*                SizedBox(
                  height: 26,
                  width: 130,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    onChanged: (text) {},
                    onSubmitted: (text) {
                      setState(() {
                        _loja = text;
                        setState_loja = _loja;
                      });
                    },
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        hintText: 'Enter a store',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder()),
                  ),
                ),

              ],
            ),*/
        endDrawer: null,
      );
    {
      LoginPopup();
    }
  }
}

class Tela_de_entrada extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Tela_de_entrada();
  }
}

class _LoginPopupState extends State<LoginPopup> {
  @override
  Widget build(BuildContext context) {
    if (Bool_Login == true) {
      return InkWell(
        onTap: () async {
          Alert(
              context: context,
              title: "Deseja fazer Logout?",
              content: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hitalo"),
                  Text("(Estagiário)"),
                ],
              ),
              buttons: [
                DialogButton(
                  color: Colors.green,
                  onPressed: () {
                    Bool_Login = false;
                    if (!Bool_Login) {
                      Navigator.pop(context, Bool_Login);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Tela_de_entrada();
                      }), result: Bool_Login);
                    }
                  },
                  child: Text(
                    "SIM",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "NÃO",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: SizedBox(
          child: Row(children: <Widget>[
            Icon(
              Icons.account_box,
              semanticLabel: "Logout",
              size: 35,
            ),
            Text("Logout")
          ]),
        ),
      );
    }
    if (Bool_Login == false) {
      return InkWell(
        onTap: () async {
          Alert(
              context: context,
              title: "LOGIN",
              content: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) async {
                      await FuturePassword(Stream<String>.value(text));
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_box, color: Color(0xFF303030)),
                      labelText: 'Username',
                    ),
                  ),
                  TextField(
                    onChanged: (text) async {
                      await FuturePassword(Stream<String>.value(labuda));
                      password = text;
                    },
                    onSubmitted: (text) async {
                      if (Bool_Login) {
                        Navigator.pop(context, Bool_Login);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Tela_de_entrada();
                        }), result: Bool_Login);
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF303030),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  color: Color(0xFF303030),
                  onPressed: () async {
                    setState(() {
                      if (Bool_Login) {
                        Navigator.pop(context, Bool_Login);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Tela_de_entrada();
                        }), result: Bool_Login);

                        password = "";
                        user = "";
                      }
                    });
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: SizedBox(
          child: Row(children: <Widget>[
            Icon(
              Icons.account_box,
              semanticLabel: "Login",
              size: 35,
            ),
            Text("Login")
          ]),
        ),
      );
    }
  }
}

class LoginPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPopupState();
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Bool_Login == true)
      return Drawer(
        child: Column(
          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFF303030),
              ),
            ),
            Container(
              height: 100,
              child: SizedBox(
                width: 400,
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF303030), Color(0x5F303030)],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                color: Color(0xFF303030),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height - 120),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Manuais'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Manuais()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Avisos'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Pedidos de táxi'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Taxi()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Qlik Sense'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QlikSense()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Acompanhamento de Insatisfação(TMR)'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Acompanhamento_de_Insatisfacao()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Checklist Fácil'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Checklist_Facil()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('TopDesk'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TopDesk()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Gmail'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Gmail()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Bloco de Notas'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bloco_de_notas()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    if (Bool_Login == false) return null;
  }
}

class Cardjj extends StatelessWidget {
  final String Cardjj_title;

  const Cardjj({Key key, this.Cardjj_title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contextvar = context;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Big_Card_Route(
              title: this.Cardjj_title,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(0),
        width: tamanhoresposivo(105),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: tamanhoresposivo(0.75),
              spreadRadius: 0.0,
            ),
          ],
          border: Border.all(width: tamanhoresposivo(1)),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(tamanhoresposivo(5)),
            topLeft: Radius.circular(tamanhoresposivo(5)),
            bottomLeft: Radius.circular(tamanhoresposivo(20)),
            bottomRight: Radius.circular(tamanhoresposivo(20)),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              width: tamanhoresposivo(105.5),
              height: tamanhoresposivo(27),
              child: Column(
                children: <Widget>[
                  Text(
                    this.Cardjj_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: tamanhoresposivo(21),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Ontem",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: tamanhoresposivo(14),
                    ),
                  ),
                  DataToTextWidged(
                    title: this.Cardjj_title,
                    intervalo: 'Ontem',
                    tamanhodotexto: tamanhoresposivo(14.5),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  //border: Border.all(width: 1),
                  ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "Acum do mês",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: tamanhoresposivo(14.5),
                    ),
                  ),
                  DataToTextWidged(
                    title: this.Cardjj_title,
                    intervalo: 'Mês',
                    tamanhodotexto: tamanhoresposivo(14),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  //border: Border.all(width: 1),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardjjTomb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Big_Card_Route_Tombamento(
              title: 'Tomb.',
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(6),
        alignment: null,
        padding: EdgeInsets.all(0),
        width: tamanhoresposivo(102),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.75,
              spreadRadius: 0.0,
            ),
          ],
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(5.0),
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.white,
              width: tamanhoresposivo(102),
              height: tamanhoresposivo(26),
              child: Column(
                children: <Widget>[
                  Text(
                    'Tomb.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: tamanhoresposivo(22),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    titulo1Tomb,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  DataToTextWidged(
                    title: 'Tomb.',
                    intervalo: 'decima',
                    tamanhodotexto: tamanhoresposivo(15),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  //border: Border.all(width: 1),
                  ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    titulo2Tomb,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  DataToTextWidged(
                    title: 'Tomb.',
                    intervalo: 'debaixo',
                    tamanhodotexto: tamanhoresposivo(15),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  //border: Border.all(width: 1),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

//class Dadosne extends StatelessWidget {
//  final String intervalo;
//  final String Cardjj_title;
//
//  const Dadosne({Key key, this.intervalo, this.Cardjj_title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    var dadosnecolor;
//
//    return new StreamBuilder<Event>(
//      stream: FirebaseDatabase.instance
//          .reference()
//          .child(this.intervalo)
//          .child(setState_loja)
//          .onValue,
//      builder: (BuildContext context, AsyncSnapshot<Event> event) {
//        Map<dynamic, dynamic> data = event.data.snapshot.value;
//        if (!event.hasData) return new Center(child: new Text('Loading...'));
//
//        if (setState_loja.isEmpty ||
//            setState_loja.toLowerCase() == "stz" ||
//            setState_loja.toLowerCase() == "" ||
//            setState_loja.toLowerCase() == "studio z") {
//          switch (this.Cardjj_title) {
//            case "Tomb.":
//              {
//                irra = "";
//                if (this.intervalo == "Ontem") {
//                  irra = irraTomb1;
//                }
//                if (this.intervalo == "Mês") {
//                  irra = irraTomb2;
//                }
//              }
//              break;
//
//            default:
//              {
//                irra = "";
//              }
//              break;
//          }
//        } else {
//          switch (this.Cardjj_title) {
//            case "Tomb.":
//              {
//                if (irraTomb2 == "Não realizado") {
//                  dadosnecolor = Colors.red;
//                  irra = "Não realizado";
//                } else {
//                  if (this.intervalo == "Ontem") {
//                    irra = irraTomb1;
//                  }
//                }
//                if (this.intervalo == "Mês") {
//                  if (irraTomb2 == "Não realizado") {
//                    dadosnecolor = Colors.red;
//                    irra = "Não realizado";
//                  } else {
//                    irra = NumberFormat('#.##%', 'pt_BR')
//                        .format(double.parse(irraTomb2));
//                  }
//                }
//              }
//              break;
//
//            default:
//              {}
//              break;
//          }
//        }
//
//        return Container(
//          padding: EdgeInsets.only(bottom: tamanhoresposivo(7.5), top: 0),
//          child: Text(
//            irra.toString(),
//            textAlign: TextAlign.center,
//            style:
//                TextStyle(color: dadosnecolor, fontSize: tamanhoresposivo(14)),
//          ),
//        );
//      },
//    );
//  }
//}
//
//funcaoqualquer1() async {
//  if (setState_loja.isEmpty ||
//      setState_loja.toLowerCase() == "stz" ||
//      setState_loja.toLowerCase() == "" ||
//      setState_loja.toLowerCase() == "studio z") {
//    irraTomb1 = "";
//    irraTomb2 = "";
//    FirebaseDatabase.instance
//        .reference()
//        .child('TombamentoSTZ')
//        .once()
//        .then((DataSnapshot STZDataSnapshot00) async {
//      Map<dynamic, dynamic> values00 = STZDataSnapshot00.value;
//      irraTomb1 = STZDataSnapshot00.value['TombNaoRealizado'].toString();
//      irraTomb2 = STZDataSnapshot00.value['TombOk'].toString();
//    });
//  } else if (setState_loja.startsWith("1")) {
//    FirebaseDatabase.instance
//        .reference()
//        .child('Tombamento')
//        .child(setState_loja)
//        .once()
//        .then((DataSnapshot LojaDataSnapshot01) {
//      irraTomb1 = LojaDataSnapshot01.value['DiaDaSemana'].toString();
//      irraTomb2 = LojaDataSnapshot01.value['Porcentagem'].toString();
//    });
//  } else {
//    irraTomb1 = "";
//    irraTomb2 = "";
//    titulo1Tomb = "Qtd. Lojas Realizadas";
//    titulo2Tomb = "Qtd. Lojas não realizados";
//  }
//}

Future<String> FuturePassword(Stream<String> data) async {
  await for (var x in data) {
    labuda = x;

    FirebaseDatabase.instance
        .reference()
        .child('Users')
        .once()
        .then((DataSnapshot STZDataSnapshot0) {
      user = STZDataSnapshot0.value[x].toString();

      if (user == password) {
        Bool_Login = true;
      }
    });
  }

  return user;
}
