import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'main.dart';

var idiota;
var dadoString = "";
var tamanhodotexto1 = 12.0;
var fontSize = 0.0;
var contextvar;

//Map<dynamic, dynamic> VariablesCache;

var dadocard = 0.0;
var dadocardmeta = 0.0;
var datamaplocal = datamapglobal;
Color colorbytitle = Colors.black;

class DataToTextWidged extends StatelessWidget {
  final String indicador;
  final String title;
  final String intervalo;

  final dynamic tamanhodotexto;

  const DataToTextWidged(
      {Key key,
      this.indicador,
      this.title,
      this.intervalo,
      this.tamanhodotexto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    contextvar = context;

    if (setState_loja.isEmpty ||
        setState_loja.toLowerCase() == "stz" ||
        setState_loja.toLowerCase() == "" ||
        setState_loja.toLowerCase() == "studio z") {
      titulo1Tomb = "Realizados";
      titulo2Tomb = "Não realizados";

      dadocard = caculovardadocardSTZ(this.title, this.intervalo);
      dadocardmeta = caculovardadocardSTZMeta(this.title, this.intervalo);

      dadoString = dadocard.toString();
      dadoString = NumberFormat(formatodado(this.title), 'pt_BR')
          .format(double.parse(dadoString));
    } else if (setState_loja.startsWith("1")) {
      titulo1Tomb = "Dia";
      titulo2Tomb = "%Saldo";

      dadocard = caculovardadocardLoja(this.title, this.intervalo);
      dadocardmeta = caculovardadocardLojaMeta(this.title, this.intervalo);

      dadoString = dadocard.toString();
      dadoString = NumberFormat(formatodado(this.title), 'pt_BR')
          .format(double.parse(dadoString));

      if (this.title == "Tomb.") {
        var dia = idiota['Tombamento'][setState_loja]['DiaDaSemana'].toString();
        if (this.intervalo == 'decima')
          dadoString =
              idiota['Tombamento'][setState_loja]['DiaDaSemana'].toString();

        if (dadoString == 'seg.') colorbytitle = Colors.blueAccent;
        if (dadoString == 'ter.') colorbytitle = Colors.lightBlueAccent;
        if (dadoString == 'qua.') colorbytitle = Colors.greenAccent;
        if (dadoString == 'qui.') colorbytitle = Color(0xFFFDD835);
        if (dadoString == 'sex.') colorbytitle = Colors.redAccent;
        if (dadoString == '') {
          colorbytitle = Colors.redAccent;
          dadoString = 'Não realizado';
        }

        if (this.intervalo == 'debaixo') if (dia != '')
          dadoString = NumberFormat('#.##%', 'pt_BR')
              .format(idiota['Tombamento'][setState_loja]['Porcentagem']);
      }
    } else {
      titulo1Tomb = "Não realizados";
      titulo2Tomb = "Realizados";

      dadocard = caculovardadocardRegional(this.title, this.intervalo);
      dadocardmeta = caculovardadocardRegionalMeta(this.title, this.intervalo);

      dadoString = dadocard.toString();
      dadoString = NumberFormat(formatodado(this.title), 'pt_BR')
          .format(double.parse(dadoString));
    }

    if (this.tamanhodotexto == null) {
      tamanhodotexto1 = 12;
    } else {
      tamanhodotexto1 = tamanhodotexto;
    }
    ;
    if (this.indicador == null) dadoString = dadoString;
    if (this.indicador == 'Meta')
      dadoString =
          NumberFormat(formatodado(this.title), 'pt_BR').format(dadocardmeta);
    if (this.indicador == 'Diferença%')
      dadoString = NumberFormat('#.##%', 'pt_BR')
          .format(((dadocard / dadocardmeta) - 1));
    if (this.indicador == 'DiferençaQtd')
      dadoString = NumberFormat(formatodado(this.title), 'pt_BR')
          .format((dadocard - dadocardmeta));

    if (dadoString == null) {
      dadoString = "sem dado...";
    }
    //fim do código
    return Container(
      margin: EdgeInsets.all(tamanhoresposivo(4.5)),
      child: Text(
        dadoString,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: dadocolor(),
          fontSize: tamanhoresposivo(tamanhodotexto1),
          shadows: <Shadow>[
            Shadow(
              offset: Offset(tamanhoresposivo(0.0), tamanhoresposivo(0.0)),
              blurRadius: tamanhoresposivo(0.9),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

double tamanhoresposivo(a) {
  var tamanho;
  if (a != null) {
    if (MediaQuery.of(contextvar).size.width <=
        MediaQuery.of(contextvar).size.height) {
      tamanho = (a / 360) * MediaQuery.of(contextvar).size.width;
    } else {
      tamanho = ((a / 360) * MediaQuery.of(contextvar).size.height) * 1.15;
    }
  } else {
    tamanho = (12 / 360) * MediaQuery.of(contextvar).size.width;
  }

  return tamanho;
}

Color dadocolor() {
  if (dadocard != null && dadocardmeta != null) {
    var metadiferenca = dadocard / dadocardmeta;

    if (metadiferenca >= 1.1) return Colors.blueAccent;
    if (metadiferenca >= 1 && metadiferenca < 1.1) return Colors.greenAccent;
    if (metadiferenca >= 0.9 && metadiferenca < 1) return Color(0xFFFDD835);
    if (metadiferenca < 0.9) return Colors.red;
  } else {
    return colorbytitle;
  }
}

String formatodado(String title) {
  if (title == "Vendas") return "R\$ #,###.##";
  if (title == "PA") return "###.##";
  if (title == "TKM") return "R\$ #,###.##";
  if (title == "Aprovados") return "#,###";
  if (title == "Ativados") return "#,###";
  if (title == "Prod.agre.") return "";
  if (title == "Seguros") return "#,###";
  if (title == "Assistên.") return "#,###";
  if (title == "S.rápido") return "";
  if (title == "S.produt.") return "";
  if (title == "%CJ") return "#.##%";
  if (title == "%CP") return "#.##%";
  if (title == "%NPS") return "#.##%";
  if (title == "Retornos") return "#,###";
  if (title == "Tomb.") return null;
  return "";
}

variablescacheteste(vwfinal, title, periodo) async {
  VariablesCache = [
    {
      'Ontem': {
        'STZ': {'Venda': ''}
      }
    },
    {
      'Mês': {
        'STZ': {'Venda': ''}
      }
    }
  ] as Map;

//  VariablesCache = ;
//  VariablesCache[periodo] = setState_loja;
//  VariablesCache[periodo][setState_loja] = title;
//  VariablesCache[periodo][setState_loja][title] = vwfinal;
}

Map<dynamic, dynamic> VariablesCache = {
  'Ontem': {
    'STZ': {'Vendas': ''}
  },
  'Mês': {
    'STZ': {'Vendas': ''}
  }
};

Map<dynamic, dynamic> VariablesCacheMeta = {
  'Ontem': {
    'STZ': {'Vendas': ''}
  },
  'Mês': {
    'STZ': {'Vendas': ''}
  }
};

double caculovardadocardSTZ(String title, String periodo) {
  var vw = 0.0;

  if (title == "Vendas") {
    var vw;
    var vw1 = 0.0;
    if (periodo != null &&
        vw == null &&
        VariablesCache[periodo][setState_loja][title] == "") {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['ROBATUAL'];
      });
      vw = vw1;

//      print('VariablesCache   ' + VariablesCache.toString());
      VariablesCache[periodo][setState_loja][title] = vw.toString();
//      print('VariablesCache   ' + VariablesCache.toString());
//      variablescacheteste(vw, title, periodo);
      return vw;
    } else
      print('VariablesCache  vw ' +
          VariablesCache[periodo][setState_loja][title].toString());
    return vw = double.tryParse(VariablesCache[periodo][setState_loja][title]);
  }
  if (title == "PA") {
    var vw;
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['PeçasVendidas'];
        vw2 = vw2 + v['Cupons'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "TKM") {
    var vw;
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['ROBATUAL'];
        vw2 = vw2 + v['Cupons'];
      });
      vw = vw1 / vw2;

      return vw;
    }
    /*else {
      return vw = 0.0;
    }*/
  }

  if (title == "Aprovados" && vw == null) {
    var vw;
    var vw1 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['Aprovados'];
      });
      vw = vw1;

      return vw;
    }
    /*else {
      return vw = 0.0;
    }*/
  }

  if (title == "Ativados") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['AtivadosTotal'];
      });
      vw = vw1;

      return vw;
    }
    /*else {
      return vw = 0.0;
    }*/
  }

  if (title == "Prod.agre.") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['SaqueProdutividadeReal'];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

/*  if (title == "Seguros") {
    var vw1 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v[''];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }*/

  if (title == "Assistên.") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['Assistências'];
      });
      vw = vw1;

      return vw;
    }
    /*else {
      return vw = 0.0;
    }*/
  }

  if (title == "S.rápido") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['Saques'];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "S.produt.") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['SaqueProdutividadeReal'];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "%CJ") {
    var vw;
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['CJ'];
        vw2 = vw2 + v['CP'];
      });

      print('CJ= $vw1');
      print('CP= $vw2');

      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "%CP") {
    var vw;
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['CP'];
        vw2 = vw2 + v['ROBATUAL'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "%NPS") {
    var vw;
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['MuitoSatisfeitoAjustado'];
        vw2 = vw2 + v['InsatisfeitoAjustado'];
        vw3 = vw3 + v['PesquisasAjustada'];
      });
      vw = (vw1 - vw2) / vw3;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "Retornos") {
    var vw;
    var vw1 = 0.0;

    if (periodo != null && vw == null) {
      idiota[periodo].forEach((k, v) async {
        if (v['Pedidosderetorno'] != null) {
          vw1 = vw1 + v['Pedidosderetorno'];
        }
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "Tomb.") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    idiota['Tombamento'].forEach((k, v) async {
      vw1++;
      if (v['Porcentagem'] == 'Não realizado') vw2++;
    });

    if (periodo == 'decima') return vw = vw2;
    if (periodo == 'debaixo') return vw = vw1 - vw2;
  }

  return vw = 0.0;
}

double caculovardadocardSTZMeta(String title, String periodo) {
  var vw = 0.0;

  if (title == "Vendas") {
    var vw;
    var vw1 = 0.0;
    if (periodo != null &&
        vw == null &&
        VariablesCacheMeta[periodo][setState_loja][title] == "") {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['MetaROBATUAL'];
      });
      vw = vw1;

//      print('VariablesCache   ' + VariablesCache.toString());
      VariablesCacheMeta[periodo][setState_loja][title] = vw.toString();
//      print('VariablesCache   ' + VariablesCache.toString());
//      variablescacheteste(vw, title, periodo);
      return vw;
    } else
      print('VariablesCacheMeta  vw ' +
          VariablesCacheMeta[periodo][setState_loja][title].toString());
    return vw =
        double.tryParse(VariablesCacheMeta[periodo][setState_loja][title]);
  }
  if (title == "PA") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['MetaPeçasVendidas'];
        vw2 = vw2 + v['MetaCupons'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "TKM") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['MetaROBATUAL'];
        vw2 = vw2 + v['MetaCupons'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "Aprovados") {
    var vw1 = 0.0;

//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {
//        vw1 = vw1 + v[''];
//      });
//      vw = vw1;
//
//      return vw;
//    } else {
    return vw = 0.0;
//    }
  }

  if (title == "Ativados") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;
    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['AtivadosMetaTotal'];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "Prod.agre.") {
    var vw1 = 0.0;

//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {});
//      vw = vw1;
//
//      return vw;
//    } else {
    return vw = 0.0;
//    }
  }

  if (title == "Seguros") {
    var vw1 = 0.0;

//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {
//        vw1 = vw1 + v[''];
//      });
//      vw = vw1;
//
//      return vw;
//    } else {
    return vw = 0.0;
//    }
  }

  if (title == "Assistên.") {
    var vw1 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['AssistÃªnciasMeta'];
      });
      vw = vw1;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "S.rápido") {
    var vw1 = 0.0;
//
//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {});
//      vw = vw1;
//
//      return vw;
//    } else {
    return vw = 0.0;
//    }
  }

  if (title == "S.produt.") {
    var vw1 = 0.0;

//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {});
//      vw = vw1;
//
//      return vw;
//    } else {
    return vw = 0.0;
//    }
  }

  if (title == "%CJ") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null &&
        idiota[periodo]['CJ'] != null &&
        idiota[periodo]['CP'] != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['CJMeta'];
        vw2 = vw2 + v['CPMeta'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "%CP") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    if (periodo != null) {
      idiota[periodo].forEach((k, v) async {
        vw1 = vw1 + v['MetaROBATUAL'];
        vw2 = vw2 + v['CPMeta'];
      });
      vw = vw1 / vw2;

      return vw;
    } else {
      return vw = 0.0;
    }
  }

  if (title == "%NPS") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;
//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {
//        vw1 = vw1 + v[''];
//        vw2 = vw2 + v[''];
//        vw3 = vw3 + v[''];
//      });
    vw = 0.6;

    return vw;
//    } else {
//      return vw = 0.0;
//    }
  }

  if (title == "Retornos") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;
//    if (periodo != null) {
//      idiota[periodo].forEach((k, v) async {
//        vw1 = vw1 + v[''];
//      });
    vw = 1 / 0;
//
    return vw;
//    } else {
//      return vw = 0.0;
//    }
  }

  if (title == "Tomb.") {
    idiota['Tombamento'].forEach((k, v) async {
      vw++;
    });
    return vw;
  }

  /*if (vw == null) */
  return vw = 0.0;
}

double caculovardadocardLoja(String title, String periodo) {
  var vw = 0.0;
  var vw1;
  var vw2;
  var vw3;
  var vw4;

  getLojaData(String indic1, indic2, indic3, indic4) {
    if (idiota[periodo][setState_loja] != null) {
      if (indic1 != null)
        vw1 = idiota[periodo][setState_loja][indic1].toDouble();
      if (indic2 != null)
        vw2 = idiota[periodo][setState_loja][indic2].toDouble();
      if (indic3 != null)
        vw3 = idiota[periodo][setState_loja][indic3].toDouble();
      if (indic4 != null)
        vw4 = idiota[periodo][setState_loja][indic4].toDouble();
    } else
      vw = 0.0;
  }

  vw = 0.0;
  if (title == "Vendas") {
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('ROBATUAL', null, null, null);

    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null) {
      return vw = vw1;
    } else
      return vw = 0.0;
  }
  if (title == "PA") {
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('PeçasVendidas', 'Cupons', null, null);

    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null) {
      return vw = vw1 / vw2;
    } else
      return vw = 0.0;
  }

  if (title == "TKM") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('ROBATUAL', 'PeçasVendidas', null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1 / vw2;
  }

  if (title == "Aprovados") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('Aprovados', null, null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1;
  }
  if (title == "Ativados") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;

    getLojaData('AtivadosTotal', null, null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1;
  }
  if (title == "Prod.agre.") return 0.0;
  if (title == "Seguros") return 0.0;
  if (title == "Assistên.") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;

    getLojaData('Assistências', null, null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1;
  }
  if (title == "S.rápido") return 0.0;
  if (title == "S.produt.") return 0.0;
  if (title == "%CJ") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('CJ', 'CP', null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1 / vw2;
  }
  if (title == "%CP") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('CP', 'ROBATUAL', null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1 / vw2;
  }
  if (title == "%NPS") {
    vw = 0.0;
    vw1 = 0.0;
    vw2 = 0.0;
    vw3 = 0.0;
    vw4 = 0.0;
    getLojaData('MuitoSatisfeitoAjustado', 'InsatisfeitoAjustado',
        'PesquisasAjustada', null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = (vw1 - vw2) / vw3;
  }
  if (title == "Retornos") {
    var vw = 0.0;
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    getLojaData('Pedidosderetorno', null, null, null);
    if (vw1 != null && vw2 != null && vw3 != null && vw4 != null)
      return vw = vw1;
  }
/*  if (title == "Tomb.") {
    if (periodo == 'decima')
      dadoString =
          idiota['Tombamento'][setState_loja]['DiaDaSemana'].toString();

    if (periodo == 'debaixo')
      dadoString =
          idiota['Tombamento'][setState_loja]['Porcentagem'].toString();
  }*/
  return vw = 0.0;
}

double caculovardadocardLojaMeta(String title, String periodo) {
  var vw = 0.0;
  var vw1;
  var vw2;
  var vw3;
  var vw4;

  getLojaData(String indic1, indic2, indic3, indic4) {
    var vargetLojaData = idiota[periodo][setState_loja];
    if (idiota[periodo][setState_loja] != null) {
      if (indic1 != null) {
        if (vargetLojaData[indic1] != null) {
          vw1 = vargetLojaData[indic1].toDouble();
        } else {
          vw1 = 0.0;
        }
      }
      if (indic2 != null) {
        if (vargetLojaData[indic2] != null) {
          vw2 = vargetLojaData[indic2].toDouble();
        } else {
          vw2 = 0.0;
        }
      }
      if (indic3 != null) {
        if (vargetLojaData[indic3] != null) {
          vw3 = vargetLojaData[indic3].toDouble();
        } else {
          vw3 = 0.0;
        }
      }
      if (indic4 != null) {
        if (vargetLojaData[indic4] != null) {
          vw1 = vargetLojaData[indic4].toDouble();
        } else {
          vw4 = 0.0;
        }
      }
    } else
      vw = 0.0;
  }

  if (title == "Vendas") {
    getLojaData('MetaROBATUAL', null, null, null);

    return vw = vw1;
  }
  if (title == "PA") {
    getLojaData('MetaPeçasVendidas', 'MetaCupons', null, null);

    return vw = vw1 / vw2;
  }
  if (title == "TKM") {
    getLojaData('MetaROBATUAL', 'MetaCupons', null, null);

    return vw = vw1 / vw2;
  }
  if (title == "Aprovados") {
    getLojaData(null, null, null, null);

    return vw = vw1;
  }
  if (title == "Ativados") {
    getLojaData('AtivadosMetaTotal', null, null, null);

    return vw = vw1;
  }
  if (title == "Prod.agre.") return 0.0;
  if (title == "Seguros") return 0.0;
  if (title == "Assistên.") {
    getLojaData('MetaROBATUAL', null, null, null);

    return vw = vw1;
  }
  if (title == "S.rápido") return 0.0;
  if (title == "S.produt.") return 0.0;
  if (title == "%CJ") {
    getLojaData('CJMeta', 'CPMeta', null, null);

    return vw = vw1;
  }
  if (title == "%CP") {
    getLojaData('CPMeta', 'MetaROBATUAL', null, null);

    return vw = vw1 / vw2;
  }
  if (title == "%NPS") {
    return vw = 0.6;
  }
  if (title == "Retornos") {
    return vw = 1 / 0;
  }
  if (title == "Tomb.") return null;

  return vw = 0.0;
}

double caculovardadocardRegional(String title, String periodo) {
  setState_loja = setState_loja.toUpperCase();
  var vw = 0.0;
  if (title == "Vendas") {
    vw = 0.0;
    var vw1 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['ROBATUAL'];
      }
    });
    return vw = vw1;

    return vw = 0.0;

//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) async {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
  }

  if (title == "PA") {
    vw = 0.0;
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['PeçasVendidas'];
        vw2 = vw2 + v['Cupons'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "TKM") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['ROBATUAL'];
        vw2 = vw2 + v['Cupons'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "Aprovados") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['Aprovados'];
      }
    });
    return vw = vw1;
  }
  if (title == "Ativados") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['AtivadosTotal'];
      }
    });
    return vw = vw1;
  }
//  if (title == "Prod.agre.") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
//  if (title == "Seguros") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
  if (title == "Assistên.") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['Assistências'];
      }
    });
    return vw = vw1;
  }
//  if (title == "S.rápido") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
//  if (title == "S.produt.") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
  if (title == "%CJ") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['CJ'];
        vw2 = vw2 + v['CP'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "%CP") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['CP'];
        vw2 = vw2 + v['ROBATUAL'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "%NPS") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['MuitoSatisfeitoAjustado'];
        vw1 = vw1 + v['InsatisfeitoAjustado'];
        vw1 = vw1 + v['PesquisasAjustado'];
      }
    });
    return vw = (vw1 - vw2) / vw3;
  }
  if (title == "Retornos") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['Pedidosderetorno'];
      }
    });
    return vw = vw1;
  }
  if (title == "Tomb.") {
    var vw1 = 0.0;
    var vw2 = 0.0;

    idiota['Tombamento'].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1++;
        if (v['Porcentagem'] == 'Não realizado') vw2++;
      }
    });
    if (periodo == 'decima') return vw = vw2;
    if (periodo == 'debaixo') return vw = vw1 - vw2;
  }
  return vw = 0.0;
}

double caculovardadocardRegionalMeta(String title, String periodo) {
  setState_loja = setState_loja.toUpperCase();
  var vw = 0.0;
  if (title == "Vendas") {
    vw = 0.0;
    var vw1 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['MetaROBATUAL'];
      }
    });
    return vw = vw1;

    return vw = 0.0;

//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) async {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
  }

  if (title == "PA") {
    vw = 0.0;
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['MetaPeçasVendidas'];
        vw2 = vw2 + v['MetaCupons'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "TKM") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['MetaROBATUAL'];
        vw2 = vw2 + v['MetaCupons'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "Aprovados") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['AprovadosMeta'];
      }
    });
    return vw = vw1;
  }
  if (title == "Ativados") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['AtivadosTotalMeta'];
      }
    });
    return vw = vw1;
  }
//  if (title == "Prod.agre.") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
//  if (title == "Seguros") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
  if (title == "Assistên.") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['AssistênciasMeta'];
      }
    });
    return vw = vw1;
  }
//  if (title == "S.rápido") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
//  if (title == "S.produt.") {
//    var vw1 = 0.0;
//    var vw2 = 0.0;
//    var vw3 = 0.0;
//    var vw4 = 0.0;
//
//    idiota[periodo].forEach((k, v) {
//      if (v['Loja-Regional'] == setState_loja) {
//        vw1 = vw1 + v['ROBATUAL'];
//      }
//    });
//    return vw = vw1;
//  }
  if (title == "%CJ") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['CJMeta'];
        vw2 = vw2 + v['CPMeta'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "%CP") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    idiota[periodo].forEach((k, v) async {
      if (v['Loja-Regional'] == setState_loja) {
        vw1 = vw1 + v['CPMeta'];
        vw2 = vw2 + v['MetaROBATUAL'];
      }
    });
    return vw = vw1 / vw2;
  }
  if (title == "%NPS") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    return vw = 0.6;
  }
  if (title == "Retornos") {
    var vw1 = 0.0;
    var vw2 = 0.0;
    var vw3 = 0.0;
    var vw4 = 0.0;

    return vw = 0 / 1;
  }
  if (title == "Tomb.") {
    if (periodo == 'decima') {
      vw = 0;
    } else {
      idiota['Tombamento'].forEach((k, v) async {
        if (v['Loja-Regional'] == setState_loja) {
          vw++;
        }
      });
    }
    return vw;
  }

  return vw = 0.0;
}
