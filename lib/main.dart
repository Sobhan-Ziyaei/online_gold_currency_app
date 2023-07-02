import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:online_gold_currency_app/data/model/currency.dart';
import 'package:online_gold_currency_app/di/di.dart';
import 'dart:developer' as developer;

void main() async {
  await getItInit();
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Currency>? currList;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    getData(context);
  }

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
      body: SingleChildScrollView(
        child: Padding(
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: listFutureBuilder(context)),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                decoration: const BoxDecoration(
                  color: Color(0xffE8E8E8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 54,
                      width: 154,
                      child: TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffCAC1FF),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          getData(context).then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                            _showSnackBar(
                                context, 'بروز رسانی با موفقیت انجام شد');
                          }).catchError((error) {
                            setState(() {
                              _isLoading = false;
                            });
                            _showSnackBar(context, 'بروز خطا در بروزرسانی');
                          });
                        },
                        icon: const Icon(
                          CupertinoIcons.refresh_bold,
                          color: Colors.black,
                        ),
                        label: Text(
                          'بروز رسانی',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    Text(
                      'آخرین بروزرسانی ${_getTime()}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Currency>> listFutureBuilder(BuildContext context) {
    return FutureBuilder<List<Currency>>(
      future: getData(context),
      builder: (context, snapshot) {
        if (_isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _showSnackBar(
              context,
              'بروز رسانی با موفقیت انجام شد',
            ),
          );
          List<Currency> currencyList = snapshot.data!;
          return SizedBox(
            height: 260,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: currencyList.length,
              itemBuilder: (context, position) {
                return MainItemList(
                  currency: currencyList[position],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                if (index % 10 == 0) {
                  return const AdvertismentItem();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<List<Currency>> getData(BuildContext context) async {
    final Dio dio = locator.get();
    try {
      var response = await dio.get(
          'http://sasansafari.com/flutter/api.php?access_key=flutter123456');

      List<Currency> currencyList = response.data
          .map<Currency>((jsonMapObject) => Currency.fromMapJson(jsonMapObject))
          .toList();
      return currencyList;
    } on DioException catch (ex) {
      throw ex;
    } catch (ex) {
      print(ex);
      throw ex;
    }
  }

  String _getTime() {
    DateTime now = DateTime.now();
    return DateFormat('kk:mm:ss').format(now);
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      backgroundColor: Colors.green,
    ),
  );
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
  Currency currency;
  MainItemList({super.key, required this.currency});

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
              currency.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              currency.price,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              currency.changes,
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

String getFarsiNumber(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  en.forEach((element) {
    number = number.replaceAll(element, fa[en.indexOf(element)]);
  });

  return number;
}
