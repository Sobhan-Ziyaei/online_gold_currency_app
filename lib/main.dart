import 'dart:ui';

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
      scrollBehavior: MyCustomScrollBehavior(),
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
          displaySmall: TextStyle(
            color: Colors.black,
            fontFamily: 'sm',
            fontSize: 14,
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
              width: double.infinity,
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
            ),
            SizedBox(
              height: 350,
              width: double.infinity,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, position) {
                  return const MainItemList();
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 10 == 0) {
                    return const AdvertismentItem();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertismentItem extends StatelessWidget {
  const AdvertismentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'تبلیغات',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class MainItemList extends StatelessWidget {
  const MainItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'دلار',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '27000',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '-2',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
