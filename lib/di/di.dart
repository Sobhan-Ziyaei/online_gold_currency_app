import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  //components
  locator.registerSingleton<Dio>(Dio());
}
