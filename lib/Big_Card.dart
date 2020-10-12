import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app2/GetDataFirebase.dart';

class Big_Card_Route extends StatelessWidget {
  final String title;

  const Big_Card_Route({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        automaticallyImplyLeading: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Big Card",
                textAlign: TextAlign.center,
              ),
              Row(),
              Row(),
            ],
          ),
        ),
        elevation: 3.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
//              textDirection: null,
              verticalDirection: VerticalDirection.down,
//              textBaseline: null,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFEFEF),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(
                                  tamanhoresposivo(0.0), tamanhoresposivo(0.0)),
                              blurRadius: tamanhoresposivo(0.5),
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  left: tamanhoresposivo(3),
                                  top: tamanhoresposivo(1),
                                  right: tamanhoresposivo(3),
                                  bottom: tamanhoresposivo(5)),
                              child: Text("Meta hoje"),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                border: Border.all(),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(tamanhoresposivo(0.0),
                                        tamanhoresposivo(0.0)),
                                    blurRadius: tamanhoresposivo(0.2),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Text("Em teste"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _Big_Card_Info(title: "$title", intervalo: 'Ontem'),
                    Divider(),
//                    _Big_Card_Info(title: "$title", intervalo: 'Semana'),
                    Divider(),
                    _Big_Card_Info(title: "$title", intervalo: 'Mês'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Big_Card_Info extends StatelessWidget {
  final String title;
  final String intervalo;

  const _Big_Card_Info({Key key, this.title, this.intervalo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: tamanhoresposivo(200),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFF0F0F1),
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(tamanhoresposivo(0.0), tamanhoresposivo(0.0)),
                blurRadius: tamanhoresposivo(0.5),
                color: Colors.black,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(this.title + "  real " + this.intervalo,
                          style: TextStyle(
                              fontSize: tamanhoresposivo(21),
                              color: Colors.black)),
                      DataToTextWidged(
                        title: this.title,
                        intervalo: this.intervalo,
                        tamanhodotexto: tamanhoresposivo(21),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Meta real " + this.intervalo,
                          style: TextStyle(
                              fontSize: tamanhoresposivo(21),
                              color: Colors.black)),
                      DataToTextWidged(
                        indicador: 'Meta',
                        intervalo: this.intervalo,
                        title: this.title,
                        tamanhodotexto: tamanhoresposivo(21),
                      ),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Difereça% " + this.intervalo,
                          style: TextStyle(
                              fontSize: tamanhoresposivo(18),
                              color: Colors.black)),
                      DataToTextWidged(
                          indicador: 'Diferença%',
                          intervalo: this.intervalo,
                          title: this.title,
                          tamanhodotexto: tamanhoresposivo(18)),
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Diferença# " + this.intervalo,
                          style: TextStyle(
                            fontSize: tamanhoresposivo(18),
                            color: Colors.black,
                          )),
                      DataToTextWidged(
                          indicador: 'DiferençaQtd',
                          intervalo: this.intervalo,
                          title: this.title,
                          tamanhodotexto: tamanhoresposivo(18))
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Cresc. sem a.a " + this.intervalo,
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text("Em breve",
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
