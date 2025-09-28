import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class ApiServices {
  Future<List<Datum>> fetchUsers() async {
   // Future.delayed(Duration(minutes: 1));
    final res = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (res.statusCode == 200) {
      final decoded = await jsonDecode(res.body);
      final userResponse = UserResponse.fromJson(decoded);
      return userResponse.data;
      // return only list of Datum
      print("Response status: ${res.statusCode}");
      print("Response body: ${res.body}");

    } else {
      throw Exception("Failed to load users");
    }
  }
}


