import 'package:dio/dio.dart';
import 'package:tedikap_flutter_app/common/global_variable.dart';

class TedikapApiRepository {
  static String mainUrl = GlobalVariables.baseUrl;
  final Dio _dio = Dio();

  var getAllDrinks = '$mainUrl/api/drinks/show';
  var getSnack = '$mainUrl/api/snacks/show';
  var getTea = '$mainUrl/api/tea/show';
  var getNonTea = '$mainUrl/api/nontea/show';
  var getMilk = '$mainUrl/api/milk/show';
}
