import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gotrip/Drawer/drawerScreen.dart';
import 'package:gotrip/repo/catogoryr_epo.dart';
import 'package:http/http.dart' as http;

class Countries extends StatefulWidget {

  List<String> category;
  int Index;
  List<String> category_name;

  Countries(this.category, this.Index, this.category_name);


  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {

  bool status = false;
  bool stat = false;
  List l = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllCountries();
    // ApiServices.catogory();

  }

 Future<void> AllCountries() async {

      var url = 'https://restcountries.com/v2/all';
      final response = await Dio().get(url);
      print("response :- $response");

      print(response.statusCode);
      print("response :-===  ${response.data}");

      if(response.statusCode == 200)
        {
          l = response.data;
          // var a = jsonDecode(response.body);
          // country = (json.decode(a) as List).map((e) => contri.fromJson(e)).toList();

          // Map map = jsonDecode(response.data);
          //
          // contri country = contri.fromJson(map);
          //
          // print(country);
          //
          // l = country as List;

          setState(() {
            stat = true;
          });
          print(stat);
        }



  }

  @override
  Widget build(BuildContext context) {

    ApiServices.catogory();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'arial',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                      drawerScreen(),
                  transitionsBuilder: (context, animation,
                      secondaryAnimation, child) {
                    return FadeTransition(opacity: animation,child: child,);
                  },
                ));
          }, icon: Icon(Icons.arrow_back_ios_sharp)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff06b5d7), Color(0xff6dd9ef)])),
          ),
          centerTitle: true,
          title: Text("${widget.category_name[widget.Index]}",style: GoogleFonts.signikaNegative(textStyle: TextStyle(fontSize: 22, color: Colors.black))),
        ),

        body: stat ? Container(
          height: 500,
          child: MasonryGridView.count(
            itemCount: l.length,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 20,
                          color: Colors.black,
                          offset: Offset(2, 4),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Image.network('${l[index]["flags"]["png"]}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center
                        ,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 10),
                            child: Text(
                              "${l[index]["name"]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Capital : ${l[index]["capital"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "Territory : ${l[index]["region"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
              //   Container(
//   height: 250,
//   margin: EdgeInsets.only(top: 5,left: 5),
//   width: double.infinity/2,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(
//         blurRadius: 20,
//         offset: Offset(2, 4),
//         color: Colors.black,
//         spreadRadius: -10
//       ),
//
//     ]
//   ),
// );
            },
          ),
        ) : Center(child: CircularProgressIndicator(color: Colors.black,),),
      ),
    );
  }
}



/*
class contri {
  String? name;
  List<String>? topLevelDomain;
  String? alpha2Code;
  String? alpha3Code;
  List<String>? callingCodes;
  String? capital;
  List<String>? altSpellings;
  String? subregion;
  String? region;
  int? population;
  List<int>? latlng;
  String? demonym;
  int? area;
  List<String>? timezones;
  List<String>? borders;
  String? nativeName;
  String? numericCode;
  Flags? flags;
  List<Currencies>? currencies;
  List<Languages>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBlocs>? regionalBlocs;
  String? cioc;
  bool? independent;

  contri(
      {this.name,
        this.topLevelDomain,
        this.alpha2Code,
        this.alpha3Code,
        this.callingCodes,
        this.capital,
        this.altSpellings,
        this.subregion,
        this.region,
        this.population,
        this.latlng,
        this.demonym,
        this.area,
        this.timezones,
        this.borders,
        this.nativeName,
        this.numericCode,
        this.flags,
        this.currencies,
        this.languages,
        this.translations,
        this.flag,
        this.regionalBlocs,
        this.cioc,
        this.independent});

  contri.fromJson(Map json) {
    name = json['name'];
    topLevelDomain = json['topLevelDomain'].cast<String>();
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    callingCodes = json['callingCodes'].cast<String>();
    capital = json['capital'];
    altSpellings = json['altSpellings'].cast<String>();
    subregion = json['subregion'];
    region = json['region'];
    population = json['population'];
    latlng = json['latlng'].cast<int>();
    demonym = json['demonym'];
    area = json['area'];
    timezones = json['timezones'].cast<String>();
    borders = json['borders'].cast<String>();
    nativeName = json['nativeName'];
    numericCode = json['numericCode'];
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currencies.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(new Languages.fromJson(v));
      });
    }
    translations = json['translations'] != null
        ? new Translations.fromJson(json['translations'])
        : null;
    flag = json['flag'];
    if (json['regionalBlocs'] != null) {
      regionalBlocs = <RegionalBlocs>[];
      json['regionalBlocs'].forEach((v) {
        regionalBlocs!.add(new RegionalBlocs.fromJson(v));
      });
    }
    cioc = json['cioc'];
    independent = json['independent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['topLevelDomain'] = this.topLevelDomain;
    data['alpha2Code'] = this.alpha2Code;
    data['alpha3Code'] = this.alpha3Code;
    data['callingCodes'] = this.callingCodes;
    data['capital'] = this.capital;
    data['altSpellings'] = this.altSpellings;
    data['subregion'] = this.subregion;
    data['region'] = this.region;
    data['population'] = this.population;
    data['latlng'] = this.latlng;
    data['demonym'] = this.demonym;
    data['area'] = this.area;
    data['timezones'] = this.timezones;
    data['borders'] = this.borders;
    data['nativeName'] = this.nativeName;
    data['numericCode'] = this.numericCode;
    if (this.flags != null) {
      data['flags'] = this.flags!.toJson();
    }
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.toJson();
    }
    data['flag'] = this.flag;
    if (this.regionalBlocs != null) {
      data['regionalBlocs'] =
          this.regionalBlocs!.map((v) => v.toJson()).toList();
    }
    data['cioc'] = this.cioc;
    data['independent'] = this.independent;
    return data;
  }
}

class Flags {
  String? svg;
  String? png;

  Flags({this.svg, this.png});

  Flags.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png = json['png'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['svg'] = this.svg;
    data['png'] = this.png;
    return data;
  }
}

class Currencies {
  String? code;
  String? name;
  String? symbol;

  Currencies({this.code, this.name, this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Languages {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Languages({this.iso6391, this.iso6392, this.name, this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso639_1'] = this.iso6391;
    data['iso639_2'] = this.iso6392;
    data['name'] = this.name;
    data['nativeName'] = this.nativeName;
    return data;
  }
}

class Translations {
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? hu;

  Translations(
      {this.br,
        this.pt,
        this.nl,
        this.hr,
        this.fa,
        this.de,
        this.es,
        this.fr,
        this.ja,
        this.it,
        this.hu});

  Translations.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    hu = json['hu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['pt'] = this.pt;
    data['nl'] = this.nl;
    data['hr'] = this.hr;
    data['fa'] = this.fa;
    data['de'] = this.de;
    data['es'] = this.es;
    data['fr'] = this.fr;
    data['ja'] = this.ja;
    data['it'] = this.it;
    data['hu'] = this.hu;
    return data;
  }
}

class RegionalBlocs {
  String? acronym;
  String? name;

  RegionalBlocs({this.acronym, this.name});

  RegionalBlocs.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acronym'] = this.acronym;
    data['name'] = this.name;
    return data;
  }
}*/
