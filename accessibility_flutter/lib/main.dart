import 'package:accessibility_flutter/v_accessibility.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          DemoLocalizations.of(context).title,
      localizationsDelegates: [
// ... app-specific localization delegate[s] here
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        // const Locale('en', ''), //Supporting English
        // const Locale('hi', ''), // Supporting Hindi
        const Locale('es', ''), // Supporting Spanish
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ViewAccessbility(),
    );
  }
}

class DemoLocalizations {
  DemoLocalizations(this.locale);
  final Locale locale;
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> localizedValues = {
    'es': {
      'title': 'Local en españa',
    },
    // 'en': {
    //   'title': 'Locale in English',
    // },
    // 'hi': {
    //   'title': 'लोके ल ि◌हंद+ म',
    // },
  };

  String get title {
    return localizedValues[locale.languageCode]!['title']!;
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) =>
      ['es'].contains(locale.languageCode); //change languange
  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
