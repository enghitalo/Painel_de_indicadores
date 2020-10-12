//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Acompanhamento_de_Insatisfacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF218a21)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl:
                  "http://admin.vspesquisa.com.br/vspesquisa/listagem-acompanhamento-insatisfacao",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}

class Checklist_Facil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF218a21)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl:
                  "https://www.checklistfacil.com.br/checklist/?modules-success#",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}

class TopDesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF8a2121)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl:
                  "https://topdesk.grupocalcenter.com.br/tas/public/ssp/",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}

class Gmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF8a2121)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl:
                  "https://mail.google.com/mail/mu/mp/66/#tl/priority/%5Esmartlabel_personal",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}

class Manuais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF212121)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl:
                  "https://drive.google.com/drive/u/0/mobile/folders/1kfswnsXDfgaiU-ZYCTC7prv5DaBO6LpK",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}

class Bloco_de_notas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(color: Color(0xFF212121)),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20),
            child: WebView(
              initialUrl: "https://keep.google.com/u/1/#home",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}
