//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QlikSense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: true,
        title: Container(
          width: null,
          height: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("QlikSense lista"),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Indicadores de Satisfação'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Indicadores_Satisfacao()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('WFM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WFM()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Indicadores críticos de Satisfação'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Indicadores_criticos_Satisfacao()),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

class Indicadores_Satisfacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: true,
        title: Container(
          width: null,
          height: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Indicadores de Satisfação"),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: WebView(
          initialUrl:
              "https://bi.grupocalcenter.com.br/extensions/me-conta/home.html",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class WFM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: true,
        title: Container(
          width: null,
          height: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("WFM"),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: WebView(
          initialUrl:
              "https://bi.grupocalcenter.com.br/form/extensions/wfm_lojas/wfm_lojas.html?qlikTicket=P7aHX56.WlfvSax2#/app/visaoCaixa",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class Indicadores_criticos_Satisfacao extends StatelessWidget {
  // final DatabaseReference daadad = FirebaseDatabase.instance.reference().child('dgdg').;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: true,
        title: Container(
          width: null,
          height: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Ind. Crí. de Satis."),
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: WebView(
          initialUrl:
              "https://bi.grupocalcenter.com.br/sense/app/d9625e30-58f2-4ef2-b21c-bc6956e3ee71/sheet/c6037e4b-b59f-422d-8cdf-4d596443a62c/state/0",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}




