import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app2/GetDataFirebase.dart';
import 'package:intl/intl.dart';

import 'main.dart';

List<TableRow> tableRows = [];

class Big_Card_Route_Tombamento extends StatelessWidget {
  final String title;

  const Big_Card_Route_Tombamento({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (setState_loja.isEmpty ||
        setState_loja.toLowerCase() == "stz" ||
        setState_loja.toLowerCase() == "" ||
        setState_loja.toLowerCase() == "studio z") {
      var colortonow = Colors.white;

      tableRows.clear();

      idiota['Tombamento'].forEach((k, v) async {
        var porcentagem = "";

        if (v['DiaDaSemana'] == "") {
          porcentagem = v['Porcentagem'].toString();
          colortonow = Colors.redAccent;
        } else {
          porcentagem = NumberFormat('#.##%', 'pt_BR').format(v['Porcentagem']);
          colortonow = Colors.white;
        }
        tableRows.add(TableRow(
            decoration: BoxDecoration(
              color: colortonow,
            ),
            children: [
              Center(
                child: Text(
                  k.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: tamanhoresposivo(17)),
                ),
              ),
              Center(
                child: Text(v['Loja-Regional'],
                    style: TextStyle(fontSize: tamanhoresposivo(17))),
              ),
              Center(
                child: Text(v['DiaDaSemana'],
                    style: TextStyle(fontSize: tamanhoresposivo(17))),
              ),
              Center(
                child: Text(porcentagem,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: tamanhoresposivo(17))),
              ),
            ]));
      });
    } else if (setState_loja.startsWith("1")) {
      tableRows.clear();
      var colortonow = Colors.white;
      idiota['Tombamento'][setState_loja].forEach((k, v) async {
        var porcentagem = "";

        if (idiota['Tombamento'][setState_loja]['DiaDaSemana'] == "") {
          porcentagem =
              idiota['Tombamento'][setState_loja]['Porcentagem'].toString();
          colortonow = Colors.redAccent;
        } else {
          porcentagem = NumberFormat('#.##%', 'pt_BR').format(v['Porcentagem']);
          colortonow = Colors.white;
        }
        tableRows.add(TableRow(
            decoration: BoxDecoration(
              color: colortonow,
            ),
            children: [
              Center(
                child: Text(
                  k.toString(),
                  style: TextStyle(fontSize: tamanhoresposivo(18)),
                ),
              ),
              Center(
                child: Text(v['Loja-Regional'],
                    style: TextStyle(fontSize: tamanhoresposivo(18))),
              ),
              Center(
                child: Text(v['DiaDaSemana'],
                    style: TextStyle(fontSize: tamanhoresposivo(18))),
              ),
              Center(
                child: Text(porcentagem,
                    style: TextStyle(fontSize: tamanhoresposivo(18))),
              ),
            ]));
      });
    } else {
      tableRows.clear();
      var colortonow = Colors.white;
      idiota['Tombamento'].forEach((k, v) async {
        var porcentagem = "";

        if (v['Loja-Regional'] == setState_loja) {
          if (v['DiaDaSemana'] == "") {
            porcentagem = v['Porcentagem'].toString();
            colortonow = Colors.redAccent;
          } else {
            porcentagem =
                NumberFormat('#.##%', 'pt_BR').format(v['Porcentagem']);
            colortonow = Colors.white;
          }
          tableRows.add(TableRow(
              decoration: BoxDecoration(
                color: colortonow,
              ),
              children: [
                Center(
                  child: Text(
                    k.toString(),
                    style: TextStyle(fontSize: tamanhoresposivo(18)),
                  ),
                ),
                Center(
                  child: Text(v['Loja-Regional'],
                      style: TextStyle(fontSize: tamanhoresposivo(18))),
                ),
                Center(
                  child: Text(v['DiaDaSemana'],
                      style: TextStyle(fontSize: tamanhoresposivo(18))),
                ),
                Center(
                  child: Text(porcentagem,
                      style: TextStyle(fontSize: tamanhoresposivo(18))),
                ),
              ]));
        }
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        automaticallyImplyLeading: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Tombamento $setState_loja - Big Card ",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        elevation: 3.0,
      ),
      body: _Big_Card_Table(),
    );
  }
}

class _Big_Card_Table extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10)),
//            boxShadow: <BoxShadow>[
//              BoxShadow(
//                offset: Offset(tamanhoresposivo(0.0), tamanhoresposivo(0.0)),
//                blurRadius: tamanhoresposivo(0),
//                color: Color(0xFF212121),
//              ),
//            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tombamento',
                  style: TextStyle(fontSize: tamanhoresposivo(35)),
                ),
                Divider(
                  height: 0,
                  color: Colors.black,
                ),
                Table(
                  border: TableBorder(
                    bottom: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    horizontalInside: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    verticalInside: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  children: [
                    TableRow(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Lojas',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: tamanhoresposivo(20),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Regional',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: tamanhoresposivo(20),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Dia da semana',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: tamanhoresposivo(20),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Porcent. em saldo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: tamanhoresposivo(20),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ]),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(contextvar).size.height * 0.7,
                      child: ListView(
                        children: <Widget>[
                          Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                            ),
                            children: tableRows,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ]),
        ),
      ],
    );
  }
}
