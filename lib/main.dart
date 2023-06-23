import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/menu.png'),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'قیمت به روز ارز',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Image.asset('assets/images/currency.png'),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'نرخ آزاد ارز چیست ؟ ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/images/icon_question.png'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند',
                style: TextStyle(color: Colors.black, fontSize: 13),
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
