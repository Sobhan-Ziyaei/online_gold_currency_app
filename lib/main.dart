import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Image.asset('assets/images/currency.png'),
            const SizedBox(
              width: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'قیمت به روز ارز',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'sb',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/menu.png'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/icon_question.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'نرخ آزاد ارز چیست ؟ ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sm',
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند',
                style: TextStyle(
                    color: Colors.black, fontSize: 13, fontFamily: 'sm'),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        ),
      ),
    );
  }
}
