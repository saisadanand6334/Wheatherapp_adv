// e79a5589a86648fdaab102049230102
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'whether_models.dart';


class Whetherdata {
  Future<Wether> getWhetherData(String place) async {
    try {
      final parameters = {
        'key': '64fa18e21f04491e8b183743230602',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', parameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Wether.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Cannot display");
      }
    } catch (e) {
      rethrow;
    }
  }
}
