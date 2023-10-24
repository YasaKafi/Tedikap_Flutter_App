import 'package:dio/dio.dart';
import 'package:tedikap_flutter_app/common/global_variable.dart';


class MovieRepository {
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static String mainUrl = GlobalVariables.baseUrl;
  final Dio _dio = Dio();

  var getAllDrinks = '$mainUrl/api/drinks/show';
  var getTea = '$mainUrl/api/tea/show';
  var getNonTea = '$mainUrl/api/nontea/show';
  var getMilk = '$mainUrl/api/milk/show';

}