import 'dart:convert';
import '/utils/const.dart';
import '/model/football_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<FootBallModel>> getFootballMatch() async {
    List<FootBallModel> footBallMatchList = <FootBallModel>[];

    http.Response response = await http.get(Uri.parse(baseURL));

    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body)['response'];
      List<FootBallModel> footballList =
          dataList.map((e) => FootBallModel.fromJson(e)).toList();
      footBallMatchList = footballList;
    }

    return footBallMatchList;
  }
}
