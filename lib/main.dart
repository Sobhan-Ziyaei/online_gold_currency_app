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
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'sb',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          headlineMedium: TextStyle(
            fontFamily: 'sm',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'sm',
            fontSize: 13,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'sm',
            fontSize: 14,
          ),
        ),
      ),
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          const SizedBox(
            width: 8,
          ),
          Image.asset('assets/images/currency.png'),
          const SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('قیمت به روز ارز',
                style: Theme.of(context).textTheme.headlineLarge),
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
                Text(
                  'نرخ آزاد ارز چیست ؟ ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 34,
              decoration: const BoxDecoration(
                color: Color(0xff828282),
                borderRadius: BorderRadius.all(
                  Radius.circular(1000),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'نام آزاد ارز',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'قیمت',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'تغییر',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
