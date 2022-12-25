import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/model.dart';

class GetInformationRepository {
  getInformation() async {
    try {
      Response response =
          await http.get(Uri.parse('https://nbu.uz/uz/exchange-rates/json/'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<Nbu> categories =
            (jsonData as List?)?.map((e) => Nbu.fromJson(e)).toList() ?? [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
  }
}
